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
    @Published var isLoadingMore = false
    @Published var hasMoreData: Bool {
        didSet {
            UserDefaults.standard.set(hasMoreData, forKey: "hasMoreData")
        }
    }

    private var context: NSManagedObjectContext
    private var cmcontinue: String? {
        didSet {
            UserDefaults.standard.set(cmcontinue, forKey: "cmcontinue")
        }
    }

    init(context: NSManagedObjectContext) {
        self.context = context

        // Restore persisted values
        self.cmcontinue = UserDefaults.standard.string(forKey: "cmcontinue")
        self.hasMoreData = UserDefaults.standard.bool(forKey: "hasMoreData")

        // If `hasMoreData` key doesn't exist in UserDefaults, default to `true`
        if UserDefaults.standard.object(forKey: "hasMoreData") == nil {
            self.hasMoreData = true
        }

        fetchWords()
    }

    func fetchWords() {
        isLoading = true

        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "sortTitle", ascending: true)]

        do {
            words = try context.fetch(fetchRequest)
            isLoading = false

            // If no words are found, reset cmcontinue and hasMoreData
            if words.isEmpty {
                self.cmcontinue = nil
                self.hasMoreData = true
                loadMoreWords()
            }
        } catch {
            print("Fetch error: \(error)")
            isLoading = false
        }
    }


    func loadMoreWords() {
        if !hasMoreData || isLoadingMore {
            return
        }

        isLoadingMore = true

        NetworkManager.shared.fetchWords(cmcontinue: cmcontinue) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let (wordsData, nextCmcontinue)):
                DataManager.shared.importWords(wordsData) { error in
                    DispatchQueue.main.async {
                        self.isLoadingMore = false
                        if let error = error {
                            print("Error importing words: \(error)")
                        } else {
                            self.fetchWords()
                        }
                    }
                }
                if let nextCmcontinue = nextCmcontinue {
                    self.cmcontinue = nextCmcontinue
                } else {
                    self.hasMoreData = false
                    self.cmcontinue = nil
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.isLoadingMore = false
                    print("Error fetching words: \(error)")
                }
            }
        }
    }
}
