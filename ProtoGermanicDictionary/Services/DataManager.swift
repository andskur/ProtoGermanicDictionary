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

    func fetchWords() -> [Word] {
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Fetch error: \(error)")
            return []
        }
    }

    func importWords(_ wordsData: [[String: Any]], completion: @escaping (Error?) -> Void) {
        context.perform {
            for wordData in wordsData {
                guard let fullTitle = wordData["title"] as? String else { continue }
                
                // Remove the "Reconstruction:Proto-Germanic/" prefix
                let prefix = "Reconstruction:Proto-Germanic/"
                var title = fullTitle
                if fullTitle.hasPrefix(prefix) {
                    title = String(fullTitle.dropFirst(prefix.count))
                }
                
                // Check if the word already exists
                let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "title == %@", title)
                
                do {
                    let existing = try self.context.fetch(fetchRequest)
                    if existing.isEmpty {
                        let wordEntry = Word(context: self.context)
                        wordEntry.title = title
                        wordEntry.id = UUID()
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
                DispatchQueue.main.async {
                    completion(nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(error)
                }
            }
        }
    }

}
