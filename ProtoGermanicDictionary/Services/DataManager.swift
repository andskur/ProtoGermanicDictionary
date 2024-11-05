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

    func fetchWords(wordTypeFilter: WordType? = nil) -> [Word] {
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "sortTitle", ascending: true)]
        
        if let filter = wordTypeFilter?.rawValue {
            fetchRequest.predicate = NSPredicate(format: "wordType == %@", filter)
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
