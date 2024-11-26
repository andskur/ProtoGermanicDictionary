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
    
    /// Generates hardcoded pronoun inflections only for supported pronouns.
    func generatePronounInflections() -> [GrammaticalNumber: [GrammaticalCase: [GrammaticalPerson: String]]] {
        switch self.title?.folding(options: .diacriticInsensitive, locale: .current) {
        case "ek", "wet", "wiz", "þu", "jut", "jūz", "se", "se-":
            return [
                .singular: [
                    .nominative: [
                        .first: "ek",
                        .second: "þū",
                        .reflexive: "se"
                    ],
                    .accusative: [
                        .first: "mek",
                        .second: "þek",
                        .reflexive: "sek"
                    ],
                    .dative: [
                        .first: "miz",
                        .second: "þiz",
                        .reflexive: "siz"
                    ],
                    .genitive: [
                        .first: "mīnaz",
                        .second: "þīnaz",
                        .reflexive: "sīnaz"
                    ]
                ],
                .dual: [
                    .nominative: [
                        .first: "wet",
                        .second: "jut",
                        .reflexive: "se"
                    ],
                    .accusative: [
                        .first: "unk",
                        .second: "inkw",
                        .reflexive: "sek"
                    ],
                    .dative: [
                        .first: "unkiz",
                        .second: "inkwiz",
                        .reflexive: "siz"
                    ],
                    .genitive: [
                        .first: "unkeraz",
                        .second: "inkweraz",
                        .reflexive: "sīnaz"
                    ]
                ],
                .plural: [
                    .nominative: [
                        .first: "wīz",
                        .second: "jūz",
                        .reflexive: "se"
                    ],
                    .accusative: [
                        .first: "uns",
                        .second: "izwiz",
                        .reflexive: "sek"
                    ],
                    .dative: [
                        .first: "unsiz",
                        .second: "izwiz",
                        .reflexive: "siz"
                    ],
                    .genitive: [
                        .first: "unseraz",
                        .second: "izweraz",
                        .reflexive: "se"
                    ]
                ]
            ]
        default: return [:]
        }
    }
}
