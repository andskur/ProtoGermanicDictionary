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
    static func detectStemType(nominativeSingular: String, gender: GrammaticalGender) -> NounStem {
        let ending = nominativeSingular.lowercased()
        
        // Check for specific stem types based on known patterns
        switch (ending, gender) {
        
        // a-Stem masculine (nominative ends with "az" or "s")
        case let (end, gen) where (end.hasSuffix("az") && !end.hasSuffix("jaz")) && gen == .masculine:
            return .aStem

        // ja-Stem masculine (ends with "jaz")
        case let (end, gen) where end.hasSuffix("jaz") && gen == .masculine:
            return .jaStem

        // a-Stem neuter (ends with "a")
        case let (end, gen) where end.folding(options: .diacriticInsensitive, locale: .current).hasSuffix("a") && gen == .neuter:
            return .aStem

        // ō-Stem feminine (ends with "ō")
        case let (end, gen) where end.hasSuffix("ō") && gen == .feminine:
            return .oStem
            
        case let (end, gen) where end.hasSuffix("ī") && gen == .feminine:
            return .ijStem

        // an-Stem masculine (ends with "ô")
        case let (end, gen) where end.hasSuffix("ô") && (gen == .masculine || gen == .neuter):
            return .anStem

        // ōn-Stem feminine (ends with "ǭ")
        case let (end, gen) where end.hasSuffix("ǭ") && gen == .feminine:
            return .onStem

        // īn-Stem feminine (ends with "į̄")
        case let (end, gen) where end.hasSuffix("į̄") && gen == .feminine:
            return .inStem

        // i-Stem masculine/feminine (ends with "iz")
        case let (end, gen) where end.hasSuffix("iz") && (gen == .masculine || gen == .feminine):
            return .iStem

        // i-Stem neuter (ends with "i")
        case let (end, gen) where end.hasSuffix("i") && gen == .neuter:
            return .iStem

        // u-Stem masculine/feminine (ends with "uz")
        case let (end, gen) where end.hasSuffix("uz") && (gen == .masculine || gen == .feminine):
            return .uStem

        // u-Stem neuter (ends with "u")
        case let (end, gen) where end.hasSuffix("u") && gen == .neuter:
            return .uStem

        // r-Stem (ends with "ēr" for kinship terms, usually masculine or feminine)
        case let (end, _) where end.hasSuffix("ēr"):
            return .rStem

        // z-Stem (only neuter, ends with "az")
        case let (end, gen) where end.hasSuffix("az") && gen == .neuter:
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
