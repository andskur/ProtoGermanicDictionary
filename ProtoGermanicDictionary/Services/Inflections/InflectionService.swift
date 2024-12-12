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
    static func generateAdjectivesflections(for word: Word) -> [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]] {
        guard let adjectiveStem = word.adjective
               else {
            return [:]
        }
        
        var inflections = [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]]()
        
        for number in GrammaticalNumber.allCases {
            var numberInflections: [GrammaticalCase: [GrammaticalGender: String]] = [:]
            
            for grammaticalCase in GrammaticalCase.allCases {
                var caseInflections: [GrammaticalGender: String] = [:]
                
                for gender in GrammaticalGender.allCases {
                    caseInflections[gender] = AdjectivesIflectionService.inflect(
                        adjectiveStem: adjectiveStem,
                        grammaticalCase: grammaticalCase,
                        number: number,
                        gender: gender,
                        word: word.title ?? ""
                    )
                }
                numberInflections[grammaticalCase] = caseInflections
            }
            inflections[number] = numberInflections
        }
        
        return inflections
    }
}
