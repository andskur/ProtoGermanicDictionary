//
//  WordInflectionViewModel.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 04/12/2024.
//

import Foundation

class WordInflectionViewModel: ObservableObject {
    @Published var word: Word
    
    init(word: Word) {
        self.word = word
    }
    
    func filterNounCases() -> [GrammaticalCase] {
        let inflections = word.generateNounInflections()
        
        // Filtered rows for each grammatical case
        let filteredCases = GrammaticalCase.allCases.filter { grammaticalCase in
            // Check if at least one value is not "-"
            let singular = inflections[grammaticalCase]?[.singular] ?? "-"
            let plural = inflections[grammaticalCase]?[.plural] ?? "-"
            return singular != "-" || plural != "-"
        }
        
        return filteredCases
    }
    
    func filterPersonalPronounCases(number: GrammaticalNumber) -> [GrammaticalCase] {
        let inflections = word.generatePersonalPronounInflections()
        
        let filteredCases = GrammaticalCase.allCases.filter { grammaticalCase in
            inflections[number]?[grammaticalCase]?.values.contains(where: { $0 != "-" }) == true
        }
        
        return filteredCases
    }
    
    func filterPronounPerson(number: GrammaticalNumber) -> [GrammaticalPerson] {
        let inflections = word.generatePersonalPronounInflections()
        
        let filteredPersons = GrammaticalPerson.allCases.filter { person in
            let personValues = filterPersonalPronounCases(number: number).compactMap { grammaticalCase in
                inflections[number]?[grammaticalCase]?[person]
            }
            return personValues.contains(where: { $0 != "-" && $0 != "" })
        }
        
        return filteredPersons
    }
    
    func filterGenderPronounCases(number: GrammaticalNumber) -> [GrammaticalCase] {
        let inflections = word.generateGenderPronounInflections()
        
        let filteredCases = GrammaticalCase.allCases.filter { grammaticalCase in
            inflections[number]?[grammaticalCase]?.values.contains(where: { $0 != "-" }) == true
        }
        
        return filteredCases
    }
    
    func filterPronounGenders(number: GrammaticalNumber) -> [GrammaticalGender] {
        let inflections = word.generateGenderPronounInflections()
        
        let filteredGenders = GrammaticalGender.allCases.filter { gender in
            let gendersValues = filterGenderPronounCases(number: number).compactMap { grammaticalCase in
                inflections[number]?[grammaticalCase]?[gender]
            }
            return gendersValues.contains(where: { $0 != "-" && $0 != "" })
        }
        
        return filteredGenders
    }
    
    func filterVerbMoods(tense: GrammaticalTense) -> [GrammaticalMood] {
        return GrammaticalMood.allCases.filter { !(tense == .past && $0 == .imperative) }
    }
}
