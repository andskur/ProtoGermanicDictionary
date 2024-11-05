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
    @Published var filterWordType: WordType? = nil // Holds the selected filter for word type
    @Published var searchText: String = "" {
        didSet {
            fetchWordsFromDatabase()
        }
    }

    private var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context

        // Check if data has already been loaded
        if !UserDefaults.standard.bool(forKey: "isDataLoaded") {
            preloadAllWordsWithDetails()
        } else {
            fetchWordsFromDatabase()
        }
    }

    // Fetch all words from the database after loading
    func fetchWordsFromDatabase() {
//        isLoading = true
        words = DataManager.shared.fetchWords(wordTypeFilter: filterWordType, searchText: searchText)
        sanitizeDataForDisplay()
//        isLoading = false
    }

    // Preload all words and details on the first launch
    func preloadAllWordsWithDetails() {
        isLoading = true // Start the spinner while loading

        NetworkManager.shared.fetchAllWordsWithDetails { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let wordsData):
                DataManager.shared.importWords(wordsData) { error in
                    if let error = error {
                        print("Failed to import words with error: \(error.localizedDescription)")
                    } else {
                        print("Words imported successfully")
//                        try self.context.save()
                        UserDefaults.standard.set(true, forKey: "isDataLoaded")
                        self.fetchWordsFromDatabase() // Reload words from the database
                        DispatchQueue.main.async {
                            self.isLoading = false // Stop spinner after all data is loaded
                        }
                    }
                }
                
//                self.importWords(wordsData)
            case .failure(let error):
                print("Error fetching words: \(error)")
                self.isLoading = false // Stop spinner on failure
            }
        }
    }

    // Method to apply the filter
    func applyFilter(wordType: WordType?) {
        filterWordType = wordType
        fetchWordsFromDatabase() // Re-fetch words based on the filter
    }
    
    private func sanitizeDataForDisplay() {
        words = words.map { word in
            let sanitizedWord = word
            sanitizedWord.title = word.title?.precomposedStringWithCanonicalMapping ?? "Unknown"
            
            if let translations = sanitizedWord.translations as? Set<Translation> {
                let sanitizedTranslations = translations.map { translation in
                    let sanitizedTranslation = translation
                    sanitizedTranslation.text = translation.text?
                        .precomposedStringWithCanonicalMapping
                        .trimmingCharacters(in: .whitespacesAndNewlines)
                    return sanitizedTranslation
                }
                
                // Convert sanitizedTranslations (array) back into NSSet for CoreData compatibility
                sanitizedWord.translations = NSSet(array: sanitizedTranslations)
            }
            
            return sanitizedWord
        }
    }


}
