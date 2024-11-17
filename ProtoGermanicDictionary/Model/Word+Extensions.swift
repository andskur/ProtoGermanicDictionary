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
    
    func generateNounInflections() -> [GrammaticalCase: [GrammaticalNumber: String]] {
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
    
    /// Generates verb inflections for the word based on tense, mood, number, and person.
    func generateVerbInflections() -> [GrammaticalTense: [GrammaticalMood: [GrammaticalNumber: [GrammaticalPerson: String]]]] {
        guard let verbClass = VerbClass(rawValue: self.verbClass ?? "") else {
            return [:]
        }
        
        var inflections = [GrammaticalTense: [GrammaticalMood: [GrammaticalNumber: [GrammaticalPerson: String]]]]()
        
        // Loop through all tenses, moods, numbers, and persons to generate verb inflections
        for tense in GrammaticalTense.allCases {
            var moodInflections = [GrammaticalMood: [GrammaticalNumber: [GrammaticalPerson: String]]]()

            for mood in GrammaticalMood.allCases {
                var numberInflections = [GrammaticalNumber: [GrammaticalPerson: String]]()
                
                for number in GrammaticalNumber.allCases {
                    var personInflections = [GrammaticalPerson: String]()
                    
                    for person in GrammaticalPerson.allCases {
                        personInflections[person] = verbClass.inflection(
                            for: tense,
                            mood: mood,
                            number: number,
                            person: person,
                            word: self.title ?? ""
                        )
                    }
                    
                    numberInflections[number] = personInflections
                }
                
                moodInflections[mood] = numberInflections
            }
            
            inflections[tense] = moodInflections
        }
        
        return inflections
    }
    
    
}
