//
//  NounStem.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 06/11/2024.
//

import Foundation

enum NounStem: String {
    case aStem = "a-stem"
    case jaStem = "ja-stem"
    case consonantStem = "consonant-stem"
    case iStem = "i-stem"
    case irregular = "irregular"
    case anStem = "an-stem"
    case inStem = "īn-stem"
    case onStem = "ōn-stem"
    case oStem = "ō-stem"
    case ijStem = "ī/jō-stem"
    case rStem = "r-stem"
    case uStem = "u-stem"
    case zStem = "z-stem"
    case unknown = "unknown"

    // Function to detect stem type based on nominative ending and gender
    static func detectStemType(nominativeSingular: String, gender: NounGender) -> NounStem {
        // Normalize diacritics and lowercase the nominative form
//        let normalizedEnding = nominativeSingular
//            .folding(options: .diacriticInsensitive, locale: .current)
//            .lowercased()
        
        let ending = nominativeSingular.lowercased()
        
        // Check for specific stem types based on known patterns
        switch (ending, gender) {
        
        // a-Stem masculine (nominative ends with "az" or "s")
        case let (end, gen) where ((end.hasSuffix("az") || end.hasSuffix("s")) && !end.hasSuffix("jaz")) && gen == .masculine:
            return .aStem

        // ja-Stem masculine (ends with "jaz")
        case let (end, gen) where end.hasSuffix("jaz") && gen == .masculine:
            return .jaStem

        // a-Stem neuter (ends with "a")
        case let (end, gen) where end.folding(options: .diacriticInsensitive, locale: .current).hasSuffix("a") && gen == .neuter:
            return .aStem

        // ō-Stem feminine (ends with "ō" or "u")
        case let (end, gen) where (end.hasSuffix("ō") || end.hasSuffix("u")) && gen == .femenine:
            return .oStem

        // n-Stem masculine (ends with "an" or "on")
        case let (end, gen) where (end.hasSuffix("an") || end.hasSuffix("on")) && gen == .masculine:
            return .anStem

        // ōn-Stem feminine (ends with "ōn")
        case let (end, gen) where end.hasSuffix("ōn") && gen == .femenine:
            return .onStem

        // īn-Stem feminine (ends with "īn")
        case let (end, gen) where end.hasSuffix("īn") && gen == .femenine:
            return .inStem

        // i-Stem masculine/feminine (ends with "iz")
        case let (end, gen) where end.hasSuffix("iz") && (gen == .masculine || gen == .femenine):
            return .iStem

        // i-Stem neuter (ends with "i")
        case let (end, gen) where end.hasSuffix("i") && gen == .neuter:
            return .iStem

        // u-Stem masculine/feminine (ends with "uz")
        case let (end, gen) where end.hasSuffix("uz") && (gen == .masculine || gen == .femenine):
            return .uStem

        // u-Stem neuter (ends with "u")
        case let (end, gen) where end.hasSuffix("u") && gen == .neuter:
            return .uStem

        // r-Stem (ends with "r" for kinship terms, usually masculine or feminine)
        case let (end, _) where end.hasSuffix("r"):
            return .rStem

        // z-Stem (mainly masculine, ends with "z")
        case let (end, gen) where end.hasSuffix("z") && gen == .masculine:
            return .zStem

        // General case for consonant stems that do not match vowel stems
        case let (end, _) where !end.hasSuffix("a") && !end.hasSuffix("i") && !end.hasSuffix("u") && !end.hasSuffix("ō"):
            return .consonantStem

        // Default case for unknown stems
        default:
            return .unknown
        }
    }
}
