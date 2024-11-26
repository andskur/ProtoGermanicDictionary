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
              let gender = GrammaticalGender(rawValue: self.nounGender ?? "") else {
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
    
    /// Determines if the pronoun is personal (uses GrammaticalPerson) or non-personal (uses NounGender)
    var isPersonalPronoun: Bool {
        switch self.title?.lowercased().folding(options: .diacriticInsensitive, locale: .current) {
        case "ek", "wet", "wiz", "þu", "jut", "juz", "se", "se-":
            return true
        default:
            return false
        }
    }
    
    /// Generates hardcoded pronoun inflections for supported pronouns.
    func generateGenderPronounInflections() -> [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]] {
        guard let title = self.title?.lowercased().folding(options: .diacriticInsensitive, locale: .current) else {
            return [:]
        }
        
        switch title {
        case "hwazuh" :
            return [
                .singular: [
                    .nominative: [
                        .masculine: "hwazuh",
                        .feminine: "hwōhw",
                        .neuter: "hwatuh"
                    ],
                    .accusative: [
                        .masculine: "hwanǭhw",
                        .feminine: "hwōhw",
                        .neuter: "hwatuh"
                    ],
                    .genitive: [
                        .masculine: "hwesuh",
                        .feminine: "hwezōzuh",
                        .neuter: "hwesuh"
                    ],
                    .dative: [
                        .masculine: "hwammaihw",
                        .feminine: "hwezōihw",
                        .neuter: "hwammaihw"
                    ],
                    .instrumental: [
                        .masculine: "hwēhw",
                        .feminine: "hwezōhw",
                        .neuter: "hwōhw"
                    ]
                ]
            ]
        case "hwaz" :
            return [
                .singular: [
                    .nominative: [
                        .masculine: "hwaz",
                        .feminine: "hwō",
                        .neuter: "hwat"
                    ],
                    .accusative: [
                        .masculine: "hwanǭ",
                        .feminine: "hwǭ",
                        .neuter: "hwat"
                    ],
                    .genitive: [
                        .masculine: "hwes",
                        .feminine: "hwezōz",
                        .neuter: "hwes"
                    ],
                    .dative: [
                        .masculine: "hwammai",
                        .feminine: "hwezōi",
                        .neuter: "hwammai"
                    ],
                    .instrumental: [
                        .masculine: "hwē",
                        .feminine: "hwezō",
                        .neuter: "hwō"
                    ]
                ]
            ]
        case "sahw" :
            return [
                .singular: [
                    .nominative: [
                        .masculine: "sahw",
                        .feminine: "sōhw",
                        .neuter: "þatuh"
                    ],
                    .accusative: [
                        .masculine: "þanǭhw",
                        .feminine: "þǭhw",
                        .neuter: "þatuh"
                    ],
                    .genitive: [
                        .masculine: "þasuh",
                        .feminine: "þaizōzuh",
                        .neuter: "þasuh"
                    ],
                    .dative: [
                        .masculine: "þammaihw",
                        .feminine: "þaizōihw",
                        .neuter: "þammaihw"
                    ],
                    .instrumental: [
                        .masculine: "þanōhw",
                        .feminine: "þaizōhw",
                        .neuter: "þanōhw"
                    ]
                ],
                .plural: [
                    .nominative: [
                        .masculine: "þaihw",
                        .feminine: "þôzuh",
                        .neuter: "þōhw"
                    ],
                    .accusative: [
                        .masculine: "þanzuh",
                        .feminine: "þōzuh",
                        .neuter: "þōhw"
                    ],
                    .genitive: [
                        .masculine: "þaizǫ̂hw",
                        .feminine: "þaizǫ̂hw",
                        .neuter: "þaizǫ̂hw"
                    ],
                    .dative: [
                        .masculine: "þaimazuh",
                        .feminine: "þaimazuh",
                        .neuter: "þaimazuh"
                    ],
                    .instrumental: [
                        .masculine: "þaimizuh",
                        .feminine: "þaimizuh",
                        .neuter: "þaimizuh"
                    ]
                ]
            ]
        case "saī" :
            return [
                .singular: [
                    .nominative: [
                        .masculine: "saī",
                        .feminine: "sōī",
                        .neuter: "þatī"
                    ],
                    .accusative: [
                        .masculine: "þanǭī",
                        .feminine: "þǭī",
                        .neuter: "þatī"
                    ],
                    .genitive: [
                        .masculine: "þasī",
                        .feminine: "þaizōzī",
                        .neuter: "þasī"
                    ],
                    .dative: [
                        .masculine: "þammaiī",
                        .feminine: "þaizōiī",
                        .neuter: "þammaiī"
                    ],
                    .instrumental: [
                        .masculine: "þanōī",
                        .feminine: "þaizōī",
                        .neuter: "þanōī"
                    ]
                ],
                .plural: [
                    .nominative: [
                        .masculine: "þaiī",
                        .feminine: "þôzī",
                        .neuter: "þōī"
                    ],
                    .accusative: [
                        .masculine: "þanzuh",
                        .feminine: "þôzī",
                        .neuter: "þōī"
                    ],
                    .genitive: [
                        .masculine: "þaizǫ̂ī",
                        .feminine: "þaizǫ̂ī",
                        .neuter: "þaizǫ̂ī"
                    ],
                    .dative: [
                        .masculine: "þaimazī",
                        .feminine: "þaimazī",
                        .neuter: "þaimazī"
                    ],
                    .instrumental: [
                        .masculine: "þaimizī",
                        .feminine: "þaimizī",
                        .neuter: "þaimizī"
                    ]
                ]
            ]
        case "selbaz" :
            return [
                .singular: [
                    .nominative: [
                        .masculine: "selbaz",
                        .feminine: "selbō",
                        .neuter: "selbą"
                    ],
                    .accusative: [
                        .masculine: "selbanǭ",
                        .feminine: "selbǭ",
                        .neuter: "selbą"
                    ],
                    .genitive: [
                        .masculine: "selbas",
                        .feminine: "selbaizōz",
                        .neuter: "selbas"
                    ],
                    .dative: [
                        .masculine: "selbammai",
                        .feminine: "selbaizōi",
                        .neuter: "selbammai"
                    ],
                    .instrumental: [
                        .masculine: "selbanō",
                        .feminine: "selbaizō",
                        .neuter: "selbanō"
                    ]
                ],
                .plural: [
                    .nominative: [
                        .masculine: "selbai",
                        .feminine: "selbôz",
                        .neuter: "selbō"
                    ],
                    .accusative: [
                        .masculine: "selbanz",
                        .feminine: "selbōz",
                        .neuter: "selbō"
                    ],
                    .genitive: [
                        .masculine: "selbaizǫ̂",
                        .feminine: "selbaizǫ̂",
                        .neuter: "selbaizǫ̂"
                    ],
                    .dative: [
                        .masculine: "selbaimaz",
                        .feminine: "selbaimaz",
                        .neuter: "selbaimaz"
                    ],
                    .instrumental: [
                        .masculine: "selbaimiz",
                        .feminine: "selbaimiz",
                        .neuter: "selbaimiz"
                    ]
                ]
            ]
        case "iz" :
            return [
                .singular: [
                    .nominative: [
                        .masculine: "iz",
                        .feminine: "sī",
                        .neuter: "it"
                    ],
                    .accusative: [
                        .masculine: "inǭ",
                        .feminine: "ijǭ",
                        .neuter: "it"
                    ],
                    .genitive: [
                        .masculine: "es",
                        .feminine: "ezōz",
                        .neuter: "es"
                    ],
                    .dative: [
                        .masculine: "immai",
                        .feminine: "ezōi",
                        .neuter: "immai"
                    ],
                    .instrumental: [
                        .masculine: "inō",
                        .feminine: "ezō",
                        .neuter: "inō"
                    ]
                ],
                .plural: [
                    .nominative: [
                        .masculine: "īz",
                        .feminine: "ijôz",
                        .neuter: "ijō"
                    ],
                    .accusative: [
                        .masculine: "inz",
                        .feminine: "ijōz",
                        .neuter: "ijō"
                    ],
                    .genitive: [
                        .masculine: "ezǫ̂",
                        .feminine: "ezǫ̂",
                        .neuter: "ezǫ̂"
                    ],
                    .dative: [
                        .masculine: "imaz",
                        .feminine: "imaz",
                        .neuter: "imaz"
                    ],
                    .instrumental: [
                        .masculine: "imiz",
                        .feminine: "imiz",
                        .neuter: "imiz"
                    ]
                ]
            ]
            
        default: return [:]
        }
        
    }
    
    /// Generates hardcoded pronoun inflections for supported personal pronouns.
    func generatePersonalPronounInflections() -> [GrammaticalNumber: [GrammaticalCase: [GrammaticalPerson: String]]] {
        guard let title = self.title?.lowercased().folding(options: .diacriticInsensitive, locale: .current) else {
            return [:]
        }
        
        switch title {
        case "ek", "wet", "wiz", "þu", "jut", "juz", "se", "se-":
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
