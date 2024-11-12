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
    
    func generateInflections() -> [GrammaticalCase: [GrammaticalNumber: String]] {
        guard let nounStem = NounStem(rawValue: self.nounStem ?? ""),
              let gender = NounGender(rawValue: self.nounGender ?? "") else {
            return [:]
        }
        
        var inflections = [GrammaticalCase: [GrammaticalNumber: String]]()
        
        // Loop through all grammatical cases and numbers to generate inflections
        for grammaticalCase in GrammaticalCase.allCases {
            var caseInflections: [GrammaticalNumber: String] = [:]
            
            for number in GrammaticalNumber.allCases {
                caseInflections[number] = nounStem.inflection(
                    for: grammaticalCase,
                    number: number,
                    gender: gender,
                    word: self.title ?? ""
                )
            }
            
            inflections[grammaticalCase] = caseInflections
        }
        
        return inflections
    }
}
