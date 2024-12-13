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
    @Published var adjectiveStem: AdjectivesStem? = nil
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
        
        if let storedAdjectiveStem = word.adjectiveStem {
            self.adjectiveStem = AdjectivesStem(rawValue: storedAdjectiveStem)
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
                    } else if parsedData.wordType == .adjective {
                        if parsedData.adjectiveStem == nil {
                            self?.adjectiveStem = AdjectivesStem.detectStemType(word: fullTitle)
                        } else {
                            self?.adjectiveStem = parsedData.adjectiveStem
                        }
                        
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
        DataManager.shared.updateWord(word, with: translationsTexts, wordType: wordType, nounGender: nounGender, nounStem: nounStem, verbClass: verbClass, adjectiveStem: adjectiveStem)
        
        // Refresh the translations array from the updated Core Data
        if let updatedTranslationsSet = word.translations as? Set<Translation> {
            self.translations = Array(updatedTranslationsSet).sorted { ($0.text ?? "") < ($1.text ?? "") }
        }
    }
    
    // Generic filtering function for nested dictionaries
    private func filterNestedDictionary<Key1: Hashable, Key2: Hashable, Value>(
        _ dictionary: [Key1: [Key2: Value]],
        valueFilter: (Value) -> Bool
    ) -> [Key1: [Key2: Value]] {
        dictionary.mapValues { nestedDict in
            nestedDict.filter { _, value in valueFilter(value) }
        }.filter { _, nestedDict in
            !nestedDict.isEmpty
        }
    }
}
