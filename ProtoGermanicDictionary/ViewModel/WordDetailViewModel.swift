//
//  WordDetailViewModel.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 02/11/2024.
//

import Foundation
import CoreData

class WordDetailViewModel: ObservableObject {
    @Published var word: Word
    @Published var translations: [Translation] = []
    @Published var wordType: WordType = .unknown
    @Published var isLoading = false
    
    private var context: NSManagedObjectContext
    
    init(word: Word, context: NSManagedObjectContext = DataManager.shared.context) {
        self.word = word
        self.context = context
        
        // Load existing translations
        if let translationsSet = word.translations as? Set<Translation> {
            self.translations = Array(translationsSet).sorted { ($0.text ?? "") < ($1.text ?? "") }
        }
        
        // Load wordType
        if let storedWordType = word.wordType {
            self.wordType = WordType(rawValue: storedWordType) ?? .unknown
        }
        
        if self.translations.isEmpty || word.wordType == nil {
            fetchWordDetails()
        }
    }
    
    func fetchWordDetails() {
        guard let fullTitle = word.fullTitle else { return }
        isLoading = true
        
        NetworkManager.shared.fetchWordDetails(title: fullTitle) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let content):
                    let parsedData = WiktionaryParser.parse(content: content)
                    self.wordType = parsedData.wordType
                    self.updateWordInCoreData(with: parsedData.translations)
                case .failure(let error):
                    print("Error fetching details: \(error)")
                }
            }
        }
    }
    
    private func updateWordInCoreData(with translationsTexts: [String]) {
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
        
        // Save wordType as rawValue of enum
        word.wordType = wordType.rawValue
        
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
        
        // Update the published translations array
        if let translationsSet = word.translations as? Set<Translation> {
            self.translations = Array(translationsSet).sorted { ($0.text ?? "") < ($1.text ?? "") }
        }
    }
}
