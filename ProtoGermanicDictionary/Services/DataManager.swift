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
    private let persistentContainer: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // Default initializer for production
    private init() {
        persistentContainer = NSPersistentContainer(name: "ProtoGermanicDictionary")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data load error: \(error)")
            }
        }
    }
    
    // Custom initializer for testing
    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
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
                    
                    if wordData.wordType == .noun {
                        wordEntry.nounGender = wordData.gender?.rawValue
                        wordEntry.nounStem = NounStem.detectStemType(nominativeSingular: wordData.title, gender: wordData.gender ?? GrammaticalGender.neuter).rawValue
                    } else if wordData.wordType == .verb {
                        wordEntry.verbClass = wordData.verbClass?.rawValue
                    } else if wordData.wordType == .adjective {
                        if wordData.adjectiveStem == nil {
                            wordEntry.adjectiveStem = AdjectivesStem.detectStemType(word: wordData.title).rawValue
                        } else {
                            wordEntry.adjectiveStem = wordData.adjectiveStem?.rawValue
                        }
                    }

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
    
    
    // Fetch a specific word by title
    func fetchWordDetails(title: String) -> Word? {
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)
        
        do {
            return try context.fetch(fetchRequest).first
        } catch {
            print("Fetch error: \(error)")
            return nil
        }
    }

    // Update translations and word type for a specific word
    func updateWord(_ word: Word, with translationsTexts: [String], wordType: WordType, nounGender: GrammaticalGender?, nounStem: NounStem?, verbClass: VerbClass?) {
        
        // Remove existing translations
        if let existingTranslations = word.translations as? Set<Translation> {
            for translation in existingTranslations {
                context.delete(translation)
            }
        }
        
        // Add new translations
        for text in translationsTexts {
            let translation = Translation(context: context)
            translation.text = text
            translation.word = word
        }
        
        // Update wordType
        word.wordType = wordType.rawValue
        
        if wordType == .noun {
            word.nounGender = nounGender?.rawValue
            
            word.nounStem = nounStem?.rawValue
        } else if wordType == .verb {
            word.verbClass = verbClass?.rawValue
        }
        
        saveContext()
    }
}
