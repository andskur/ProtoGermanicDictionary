//
//  InflectionService.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 06/12/2024.
//

import Foundation

class InflectionService {
    /// Generates noun inflections for the word based on stem, case and gender.
    static func generateNounInflections(for word: Word) -> [GrammaticalCase: [GrammaticalNumber: String]] {
        guard let nounStem = word.stem,
              let gender = word.gender else {
            
            return [:]
        }
        
        var inflections = [GrammaticalCase: [GrammaticalNumber: String]]()
        
        // Loop through all grammatical cases and numbers to generate inflections
        for grammaticalCase in GrammaticalCase.allCases {
            var caseInflections: [GrammaticalNumber: String] = [:]
            
            for number in GrammaticalNumber.allCases {
                caseInflections[number] = NounInflectionService.inflect(
                    nounStem: nounStem,
                    grammaticalCase: grammaticalCase,
                    number: number,
                    gender: gender,
                    word: word.title ?? ""
                )
            }
            
            inflections[grammaticalCase] = caseInflections
        }
        
        return inflections
    }
    
    /// Generates verb inflections for the word based on tense, mood, number, and person.
    static func generateVerbInflections(for word: Word) -> [GrammaticalTense: [GrammaticalMood: [GrammaticalNumber: [GrammaticalPerson: String]]]] {
        guard let verbClass = word.verb else {
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
                        personInflections[person] = VerbInflectionService.inflect(
                            verbClass: verbClass,
                            for: tense,
                            mood: mood,
                            number: number,
                            person: person,
                            word: word.title ?? ""
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
    
    /// Generates hardcoded pronoun inflections for supported pronouns.
    static func generateGenderPronounInflections(for word: Word) -> [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]] {
        guard let title = word.title?.lowercased().folding(options: .diacriticInsensitive, locale: .current),
              let inflections = PronounInflectionData.genderedPronouns[title] else {
            return [:]
        }
        return inflections
    }
    
    /// Generates hardcoded pronoun inflections for supported personal pronouns.
    static func generatePersonalPronounInflections(for word: Word) -> [GrammaticalNumber: [GrammaticalCase: [GrammaticalPerson: String]]] {
        guard (word.title?.lowercased().folding(options: .diacriticInsensitive, locale: .current)) != nil else {
            return [:]
        }

        return PronounInflectionData.personalPronouns
    }
    
    /// Generates adjective inflections
    static func generateAdjectivesflections(for word: Word) -> [AdjectiveDeclension: [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]]] {
        if let irregular = IrregularDeterminers.storage[word.title ?? "0"] {
            return irregular
        }
        
        guard let adjectiveStem = word.adjective
               else {
            return [:]
        }
        
        var inflections = [AdjectiveDeclension: [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]]]()
        
        for decl in AdjectiveDeclension.allCases {
            var declInflections: [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]] = [:]
            
            for number in GrammaticalNumber.allCases {
                var numberInflections: [GrammaticalCase: [GrammaticalGender: String]] = [:]
                
                for grammaticalCase in GrammaticalCase.allCases {
                    var caseInflections: [GrammaticalGender: String] = [:]
                    
                    for gender in GrammaticalGender.allCases {
                        caseInflections[gender] = AdjectiveInflectionService.inflect(
                            adjectiveStem: adjectiveStem,
                            grammaticalCase: grammaticalCase,
                            number: number,
                            gender: gender,
                            decl: decl,
                            word: word.title ?? ""
                        )
                    }
                    numberInflections[grammaticalCase] = caseInflections
                }
                declInflections[number] = numberInflections
            }
            inflections[decl] = declInflections
        }
        
        return inflections
    }
    
    /// Generates adjective inflections
    static func generateParticiplelIflections(for word: Word) -> [GrammaticalTense: [AdjectiveDeclension: [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]]]] {
        guard let verbClass = word.verb
               else {
            return [:]
        }
        
        var inflections = [GrammaticalTense: [AdjectiveDeclension: [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]]]]()
        
        for tense in GrammaticalTense.allCases {
            var tenseInflections: [AdjectiveDeclension: [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]]] = [:]
            
            for decl in AdjectiveDeclension.allCases {
                var declInflections: [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]] = [:]
                
                for number in GrammaticalNumber.allCases {
                    var numberInflections: [GrammaticalCase: [GrammaticalGender: String]] = [:]
                    
                    for grammaticalCase in GrammaticalCase.allCases {
                        var caseInflections: [GrammaticalGender: String] = [:]
                        
                        for gender in GrammaticalGender.allCases {
                            caseInflections[gender] = ParticipleInflectionService.inflect(
                                verbClass: verbClass,
                                for: tense,
                                number: number,
                                grammaticalCase: grammaticalCase,
                                gender: gender,
                                decl: decl,
                                word: word.title ?? ""
                            )
                        }
                        numberInflections[grammaticalCase] = caseInflections
                    }
                    declInflections[number] = numberInflections
                }
                tenseInflections[decl] = declInflections
            }
            inflections[tense] = tenseInflections
        }
        
        return inflections
    }
}
