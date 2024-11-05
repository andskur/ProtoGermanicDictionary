//
//  DataManager.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 01/11/2024.
//

import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    private init() {
        persistentContainer = NSPersistentContainer(name: "ProtoGermanicDictionary")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data load error: \(error)")
            }
        }
    }

    let persistentContainer: NSPersistentContainer

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Save error: \(error)")
            }
        }
    }

    func fetchWords(wordTypeFilter: WordType? = nil, searchText: String = "") -> [Word] {
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "sortTitle", ascending: true)]
        
        var predicates: [NSPredicate] = []
        
        // Add wordTypeFilter predicate if specified
        if let filter = wordTypeFilter?.rawValue {
            let wordTypePredicate = NSPredicate(format: "wordType == %@", filter)
            predicates.append(wordTypePredicate)
        }
        
        // Add search text predicate if searchText is not empty
        if !searchText.isEmpty {
            let normalizedSearchText = searchText.folding(options: .diacriticInsensitive, locale: .current)
            
            // Predicate to match against the word's title or any associated translation's text
            let titlePredicate = NSPredicate(format: "sortTitle CONTAINS[c] %@", normalizedSearchText)
            let translationPredicate = NSPredicate(format: "ANY translations.text CONTAINS[c] %@", normalizedSearchText)
            
            // Combine both predicates using OR
            let searchPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [titlePredicate, translationPredicate])
            predicates.append(searchPredicate)
        }
        
        // Set the final compound predicate
        if !predicates.isEmpty {
            fetchRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: predicates)
        }

        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Fetch error: \(error)")
            return []
        }
    }


    func importWords(_ wordsData: [WordData], completion: @escaping (Error?) -> Void) {
        context.perform {
            for wordData in wordsData {
                
                let skipPrefix = "Category:Proto-Germanic"
                
                if wordData.title.hasPrefix(skipPrefix) {
                    continue
                }
                
//                print(wordData.title)
                
                let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "title == %@", wordData.title)

                do {
                    let existingWords = try self.context.fetch(fetchRequest)
                    let wordEntry = existingWords.first ?? Word(context: self.context)
                    
                    // Update properties for the word entry
                    let prefix = "Reconstruction:Proto-Germanic/"
                    if wordData.title.hasPrefix(prefix) {
                        wordEntry.title = String(wordData.title.dropFirst(prefix.count))
                    } else {
                        wordEntry.title = wordData.title
                    }
                    
                    wordEntry.fullTitle = wordData.title
                    wordEntry.sortTitle = wordData.title.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
                    wordEntry.id = wordEntry.id ?? UUID()
                    wordEntry.wordType = wordData.wordType.rawValue

                    // Update translations
                    if let translations = wordEntry.translations as? Set<Translation> {
                        translations.forEach { self.context.delete($0) }
                    }
                    wordData.translations.forEach { text in
                        let translation = Translation(context: self.context)
                        translation.text = text
                        translation.word = wordEntry
                    }
                    

                } catch {
                    DispatchQueue.main.async {
                        completion(error)
                    }
                    return
                }
            }

            do {
                try self.context.save()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
}
