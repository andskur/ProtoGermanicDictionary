//
//  WordDetailViewModel.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 02/11/2024.
//

import Foundation

class WordDetailViewModel: ObservableObject {
    @Published var word: Word
    @Published var translations: [Translation] = []
    @Published var wordType: WordType = .unknown
    @Published var nounGender: GrammaticalGender? = nil
    @Published var nounStem: NounStem? = nil
    @Published var verbClass: VerbClass? = nil
    @Published var isLoading = false
    
    init(word: Word) {
        self.word = word
        
        // Load initial data from the passed word
        loadExistingWordDetails()
        
        // Fetch details if they're missing
        if translations.isEmpty || word.wordType == nil {
            fetchWordDetails()
        }
    }
    
    private func loadExistingWordDetails() {
        // Load existing translations and word type
        if let translationsSet = word.translations as? Set<Translation> {
            self.translations = Array(translationsSet).sorted { ($0.text ?? "") < ($1.text ?? "") }
        }
        
        if let storedWordType = word.wordType {
            self.wordType = WordType(rawValue: storedWordType) ?? .unknown
        }
        
        if let storedNounGender = word.nounGender {
            self.nounGender = GrammaticalGender(rawValue: storedNounGender)
        }
        
        if let storedNounStem = word.nounStem {
            self.nounStem = NounStem(rawValue: storedNounStem)  
        }
        
        if let storedVerbClass = word.verbClass {
            self.verbClass = VerbClass(rawValue: storedVerbClass)   
        }
    }
    
    func fetchWordDetails() {
        guard let fullTitle = word.fullTitle else { return }
        isLoading = true
        
        // Fetch details from network
        NetworkManager.shared.fetchWordDetails(title: fullTitle) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let content):
                    let parsedData = WiktionaryParser.parse(content: content)
                    self?.wordType = parsedData.wordType
                    
                    if parsedData.wordType == .noun {
                        self?.nounGender = parsedData.gender
                        self?.nounStem = NounStem.detectStemType(nominativeSingular: fullTitle, gender: parsedData.gender!)
                    } else if parsedData.wordType == .verb {
                        self?.verbClass = parsedData.verbClass
                    }
                    
                    self?.updateWordWithFetchedData(translationsTexts: parsedData.translations)
                case .failure(let error):
                    print("Error fetching details: \(error)")
                }
            }
        }
    }
    
    private func updateWordWithFetchedData(translationsTexts: [String]) {
        // Update word and translations in Core Data through DataManager
        DataManager.shared.updateWord(word, with: translationsTexts, wordType: wordType, nounGender: nounGender, nounStem: nounStem, verbClass: verbClass)
        
        // Refresh the translations array from the updated Core Data
        if let updatedTranslationsSet = word.translations as? Set<Translation> {
            self.translations = Array(updatedTranslationsSet).sorted { ($0.text ?? "") < ($1.text ?? "") }
        }
    }
}
