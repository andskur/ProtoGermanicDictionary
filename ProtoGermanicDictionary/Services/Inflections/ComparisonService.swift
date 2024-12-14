//
//  Comparison.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 14/12/2024.
//

import Foundation

class ComparisonService {
    static func Comparative(word: Word) -> String {
        guard let title = word.title else {return "-"}
        
        if let irregular = irregularComparison[title]?[.comparative] {
            return irregular
        }
        
        switch word.type {
        case .adjective:
            guard let adjectiveStem = word.adjective else { return "-" }
            
            let base = AdjectiveInflectionService.extractBaseForm(from: title, stem: adjectiveStem)
            
            return base + "izô"
        case .adverb:
            var base = title
            
            if isVowel(title.last!) {
               base = String(title.dropLast())
            }
            
            return base + "iz"
            
        default:
            return "-"
        }
    }
    
    static func Superlative(word: Word) -> String {
        guard let title = word.title else {return "-"}
        
        if let irregular = irregularComparison[title]?[.superlative] {
            return irregular
        }
        
        switch word.type {
        case .adjective:
            guard let adjectiveStem = word.adjective else { return "-" }
            
            let base = AdjectiveInflectionService.extractBaseForm(from: title, stem: adjectiveStem)
            
            return base + "istaz"
        case .adverb:
            var base = title
            
            if isVowel(title.last!) {
               base = String(title.dropLast())
            }
            
            return base + "ist"
            
        default:
            return "-"
        }
    }
    
    static let irregularComparison: [String: [GrammaticalComparison: String]] = [
        "wela": [
            .comparative: "batiz",
            .superlative: "batist",
        ],
        "wirsiz": [
            .superlative: "wirsist ",
        ],
        "maiz": [
            .superlative: "maist ",
        ],
        "minniz": [
            .superlative: "minnist ",
        ],
        "laisiz": [
            .superlative: "laisist ",
        ],
        "gōdaz": [
            .comparative: "batizô",
            .superlative: "batistaz",
        ],
        "ubilaz": [
            .comparative: "wirsizô",
            .superlative: "wirsistaz",
        ],
        "mikilaz": [
            .comparative: "maizô",
            .superlative: "maistaz",
        ],
        "lītilaz": [
            .comparative: "minnizô",
            .superlative: "minnistaz",
        ],
        "jungaz": [
            .comparative: "junhizô",
            .superlative: "junhistaz",
        ],
        "aldaz": [
            .comparative: "alþizô",
            .superlative: "alþistaz",
        ],
        "sinīgaz": [
            .comparative: "sinizô",
            .superlative: "sinistaz",
        ]
    ]
    
    
    private static func isVowel(_ symbol: Character) -> Bool {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u", "ą", "ē", "é", "ô", "ō"]
        return vowels.contains(symbol)
    }
}


