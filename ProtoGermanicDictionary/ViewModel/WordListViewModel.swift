//
//  WordListViewModel.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 01/11/2024.
//

import Foundation

class WordListViewModel: ObservableObject {
    @Published var words: [Word] = []
    @Published var isLoading = false
    @Published var filterWordType: WordType? = nil
    @Published var searchText: String = "" {
        didSet {
            fetchWordsFromDatabase()
        }
    }
    
    @Published var letters: [String] = []

    init() {
        if !UserDefaults.standard.bool(forKey: "isDataLoaded") {
            preloadAllWordsWithDetails()
        } else {
            fetchWordsFromDatabase()
        }
    }

    func fetchWordsFromDatabase() {
        words = DataManager.shared.fetchWords(wordTypeFilter: filterWordType, searchText: searchText)
        sanitizeDataForDisplay()
        loadLetters()
    }
    
    private func loadLetters() {
        let startingLetters = Set(words.compactMap { word in
            String(word.title?.prefix(1) ?? "").foldedToBaseUppercase()
        })
        letters = Array(startingLetters).sorted()
    }


    func preloadAllWordsWithDetails() {
        isLoading = true
        NetworkManager.shared.fetchAllWordsWithDetails { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let wordsData):
                DataManager.shared.importWords(wordsData) { error in
                    if let error = error {
                        print("Failed to import words with error: \(error.localizedDescription)")
                    } else {
                        print("Words imported successfully")
                        UserDefaults.standard.set(true, forKey: "isDataLoaded")
                        self.fetchWordsFromDatabase()
                        DispatchQueue.main.async {
                            self.isLoading = false
                        }
                    }
                }
            case .failure(let error):
                print("Error fetching words: \(error)")
                self.isLoading = false
            }
        }
    }

    func applyFilter(wordType: WordType?) {
        filterWordType = wordType
        fetchWordsFromDatabase()
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
                sanitizedWord.translations = NSSet(array: sanitizedTranslations)
            }
            
            return sanitizedWord
        }
    }
}

// String extension for normalizing letters to their base forms
extension String {
    /// Removes diacritics and converts the first character to uppercase
    func foldedToBaseUppercase() -> String {
        return self.folding(options: .diacriticInsensitive, locale: .current).prefix(1).uppercased()
    }
}
