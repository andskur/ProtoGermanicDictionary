//
//  Word+Extensions.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 03/11/2024.
//

import Foundation

extension Word {
    
    /// Computed property to generate the Wiktionary URL based on `fullTitle`.
    var wiktionaryURL: URL? {
        // Ensure `fullTitle` is not nil or empty
        guard let fullTitle = self.fullTitle, !fullTitle.isEmpty else {
            return nil
        }
        
        // Base URL for English Wiktionary
        let baseURL = "https://en.wiktionary.org/wiki/"
        
        // URL-encode the `fullTitle` to handle spaces and special characters
        guard let encodedTitle = fullTitle.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let url = URL(string: baseURL + encodedTitle) else {
            return nil
        }
        
        return url
    }
    
    /// Computed property to map `wordType` string to `WordType` enum.
    var type: WordType {
        guard let wordType = wordType, let mappedType = WordType(rawValue: wordType) else {
            return .unknown
        }
        return mappedType
    }
    
    /// Computed property to map `nounStem` string to `NounStem` enum.
    var stem: NounStem? {
        guard let nounStem = nounStem else { return nil }
        return NounStem(rawValue: nounStem)
    }
    
    /// Computed property to map `nounGender` string to `NounGender` enum.
    var gender: GrammaticalGender? {
        guard let nounGender = nounGender else { return nil }
        return GrammaticalGender(rawValue: nounGender)
    }
    
    /// Computed property to map `verbClass` string to `VerbClass` enum.
    var verb: VerbClass? {
        guard let verbClass = verbClass else { return nil }
        return VerbClass(rawValue: verbClass)
    }
    
    /// Determines if the pronoun is personal (uses GrammaticalPerson) or non-personal (uses NounGender)
    var isPersonalPronoun: Bool {
        switch self.title?.lowercased().folding(options: .diacriticInsensitive, locale: .current) {
        case "ek", "wet", "wiz", "þu", "jut", "juz", "se", "se-":
            return true
        default:
            return false
        }
    }
}
