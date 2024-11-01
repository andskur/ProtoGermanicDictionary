//
//  WordListViewModel.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 01/11/2024.
//

import Foundation
import CoreData

class WordListViewModel: ObservableObject {
    @Published var words: [Word] = []
    @Published var isLoading = false

    private var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
        fetchWords()
    }

    func fetchWords() {
        isLoading = true
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \Word.title, ascending: true)]

        do {
            words = try context.fetch(fetchRequest)
            if words.isEmpty {
                fetchAndImportWords()
            } else {
                isLoading = false
            }
        } catch {
            print("Fetch error: \(error)")
            isLoading = false
        }
    }

    private func fetchAndImportWords() {
        NetworkManager.shared.fetchFirst100Words { result in
            switch result {
            case .success(let wordsData):
                DataManager.shared.importWords(wordsData) { error in
                    if let error = error {
                        print("Error importing words: \(error)")
                    } else {
                        self.fetchWords()
                    }
                    self.isLoading = false
                }
            case .failure(let error):
                print("Error fetching words: \(error)")
                self.isLoading = false
            }
        }
    }
}
