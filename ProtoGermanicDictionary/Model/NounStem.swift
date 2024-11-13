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
    
    // Method to extract base form depending on the noun stem, case, and gender
    func extractBaseForm(from title: String, gender: NounGender) -> String {
        var root = title

        // Apply different rules depending on the noun stem type and gender
        switch self {
        case .aStem, .jaStem, .iStem, .uStem, .zStem:
            // For neuter nouns, drop 1 character; otherwise, drop 2
            root = gender == .neuter ? String(root.dropLast(1)) : String(root.dropLast(2))
        case .oStem, .ijStem:
            root = String(root.dropLast(1)) // Drop 1 character for feminine o-stems and ī/jō-stem
        case .anStem, .onStem, .inStem:
            root = String(root.dropLast(2)) // Drop 2 characters for these stems
        case .rStem:
            root = String(root.dropLast(1)) // Drop 1 character for r-stems
        case .consonantStem:
            // No specific suffix to drop for consonant stems
            break
        default:
            break
        }

        return root
    }
    
    func inflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, gender: NounGender, word: String) -> String {
        let root = extractBaseForm(from: word, gender: gender)

        switch self {
        case .aStem:
            return aStemInflection(for: grammaticalCase, number: number, root: root, gender: gender)
        case .jaStem:
            return jaStemInflection(for: grammaticalCase, number: number, root: root, gender: gender)
        case .iStem:
            return iStemInflection(for: grammaticalCase, number: number, root: root, gender: gender)
        case .uStem:
            return uStemInflection(for: grammaticalCase, number: number, root: root, gender: gender)
        case .oStem:
            return oStemInflection(for: grammaticalCase, number: number, root: root)
        case .ijStem:
            return ijStemInflection(for: grammaticalCase, number: number, root: root)
        case .consonantStem:
            return consonantStemInflection(for: grammaticalCase, number: number, root: root)
        case .anStem:
            return anStemInflection(for: grammaticalCase, number: number, root: root)
        case .inStem:
            return inStemInflection(for: grammaticalCase, number: number, root: root)
        case .onStem:
            return onStemInflection(for: grammaticalCase, number: number, root: root)
        default:
            return "-"
        }
    }
    
    // Example method for the a-stem noun inflections
    private func aStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: NounGender) -> String {
        switch (grammaticalCase, number, gender) {
        case (.nominative, .singular, .masculine): return root + "az"
        case (.nominative, .plural, .masculine): return root + "ōz"
        case (.vocative, .singular, .masculine): return root
        case (.vocative, .plural, .masculine): return root + "ōz"
        case (.accusative, .singular, .masculine): return root + "ą"
        case (.accusative, .plural, .masculine): return root + "anz"
        case (.genitive, .singular, _): return root + "as"
        case (.genitive, .plural, _): return root + "ǫ̂"
        case (.dative, .singular, _): return root + "ai"
        case (.dative, .plural, _): return root + "amaz"
        case (.instrumental, .singular, _): return root + "ō"
        case (.instrumental, .plural, _): return root + "amiz"

        // Neuter-specific cases
        case (.nominative, .singular, .neuter): return root + "ą"
        case (.nominative, .plural, .neuter): return root + "ō"
        case (.vocative, .singular, .neuter): return root + "ą"
        case (.vocative, .plural, .neuter): return root + "ō"
        case (.accusative, .singular, .neuter): return root + "ą"
        case (.accusative, .plural, .neuter): return root + "ō"

        // Default
        default: return "-"
        }
    }


    // Additional methods for other stems
    private func jaStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: NounGender) -> String {
        switch (grammaticalCase, number, gender) {
        case (.vocative, .singular, .masculine) : return root.dropLast(1) + "i"
        default: return aStemInflection(for: grammaticalCase, number: number, root: root, gender: gender)
        }
    }
    
    private func oStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String) -> String {
        switch (grammaticalCase, number) {
        case (.nominative, .singular): return root + "ō"
        case (.nominative, .plural): return root + "ôz"
        case (.vocative, .singular): return root + "ō"
        case (.vocative, .plural): return root + "ôz"
        case (.accusative, .singular): return root + "ǭ"
        case (.accusative, .plural): return root + "ōz"
        case (.genitive, .singular): return root + "ōz"
        case (.genitive, .plural): return root + "ǫ̂"
        case (.dative, .singular): return root + "ōi"
        case (.dative, .plural): return root + "ōmaz"
        case (.instrumental, .singular): return root + "ō"
        case (.instrumental, .plural): return root + "ōmiz"
        }
    }
    
    private func ijStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String) -> String {
        switch (grammaticalCase, number) {
        case (.nominative, .singular): return root + "ī"
        case (.nominative, .plural): return root + "ijôz"
        case (.vocative, .singular): return root + "ī"
        case (.vocative, .plural): return root + "ijôz"
        case (.accusative, .singular): return root + "ijǭ"
        case (.accusative, .plural): return root + "ijōz"
        case (.genitive, .singular): return root + "ijōz"
        case (.genitive, .plural): return root + "ijǫ̂"
        case (.dative, .singular): return root + "ijōi"
        case (.dative, .plural): return root + "ijōmaz"
        case (.instrumental, .singular): return root + "ijō"
        case (.instrumental, .plural): return root + "ijōmiz"
        }
    }

    private func iStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: NounGender) -> String {
        switch (grammaticalCase, number, gender) {
            
            // Nominative
        case (.nominative, .singular, .masculine), (.nominative, .singular, .feminine):
            return root + "iz"
        case (.nominative, .plural, .masculine), (.nominative, .plural, .feminine):
            return root + "īz"
        case (.nominative, .singular, .neuter):
            return root + "i"
        case (.nominative, .plural, .neuter):
            return root + "ī"
            
            // Vocative
        case (.vocative, .singular, .masculine), (.vocative, .singular, .feminine), (.vocative, .singular, .neuter):
            return root + "i"
        case (.vocative, .plural, .masculine), (.vocative, .plural, .feminine):
            return root + "īz"
        case (.vocative, .plural, .neuter):
            return root + "ī"
            
            // Accusative
        case (.accusative, .singular, .masculine), (.accusative, .singular, .feminine):
            return root + "į"
        case (.accusative, .plural, .masculine), (.accusative, .plural, .feminine):
            return root + "inz"
        case (.accusative, .singular, .neuter):
            return root + "i"
        case (.accusative, .plural, .neuter):
            return root + "ī"
            
            // Genitive
        case (.genitive, .singular, .masculine), (.genitive, .singular, .feminine):
            return root + "īz"
        case (.genitive, .plural, .masculine), (.genitive, .plural, .feminine):
            return root + "ijǫ̂"
        case (.genitive, .singular, .neuter):
            return root + "īz"
        case (.genitive, .plural, .neuter):
            return root + "ijǫ̂"
            
            // Dative
        case (.dative, .singular, _):
            return root + "ī"
        case (.dative, .plural, _):
            return root + "imaz"
            
            // Instrumental
        case (.instrumental, .singular, _):
            return root + "ī"
        case (.instrumental, .plural, _):
            return root + "imiz"
        }
    }

    private func uStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: NounGender) -> String {
        switch (grammaticalCase, number, gender) {
            
            // Nominative
        case (.nominative, .singular, .masculine), (.nominative, .singular, .feminine):
            return root + "uz"
        case (.nominative, .plural, .masculine), (.nominative, .plural, .feminine):
            return root + "iwiz"
        case (.nominative, .singular, .neuter):
            return root + "u"
        case (.nominative, .plural, .neuter):
            return root + "ū"
            
            // Vocative
        case (.vocative, .singular, .masculine), (.vocative, .singular, .feminine), (.vocative, .singular, .neuter):
            return root + "u"
        case (.vocative, .plural, .masculine), (.vocative, .plural, .feminine):
            return root + "iwiz"
        case (.vocative, .plural, .neuter):
            return root + "ū"
            
            // Accusative
        case (.accusative, .singular, .masculine), (.accusative, .singular, .feminine):
            return root + "ų"
        case (.accusative, .plural, .masculine), (.accusative, .plural, .feminine):
            return root + "unz"
        case (.accusative, .singular, .neuter):
            return root + "u"
        case (.accusative, .plural, .neuter):
            return root + "ū"
            
            // Genitive
        case (.genitive, .singular, .masculine), (.genitive, .singular, .feminine):
            return root + "auz"
        case (.genitive, .plural, .masculine), (.genitive, .plural, .feminine):
            return root + "iwǫ̂"
        case (.genitive, .singular, .neuter):
            return root + "auz"
        case (.genitive, .plural, .neuter):
            return root + "iwǫ̂"
            
            // Dative
        case (.dative, .singular, _):
            return root + "iwi"
        case (.dative, .plural, _):
            return root + "umaz"
            
            // Instrumental
        case (.instrumental, .singular, _):
            return root + "ū"
        case (.instrumental, .plural, _):
            return root + "umiz"
        }
    }

    private func anStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String) -> String {
        // Define u-stem inflections here
        return "-"
    }

    private func inStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String) -> String {
        // Define u-stem inflections here
        return "-"
    }

    private func onStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String) -> String {
        // Define u-stem inflections here
        return "-"
    }

    private func consonantStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String) -> String {
        // Define u-stem inflections here
        return "-"
    }

    // Function to detect stem type based on nominative ending and gender
    static func detectStemType(nominativeSingular: String, gender: NounGender) -> NounStem {
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

        // ō-Stem feminine (ends with "ō")
        case let (end, gen) where end.hasSuffix("ō") && gen == .feminine:
            return .oStem
            
        case let (end, gen) where end.hasSuffix("ī") && gen == .feminine:
            return .ijStem

        // n-Stem masculine (ends with "an" or "on")
        case let (end, gen) where (end.hasSuffix("an") || end.hasSuffix("on")) && gen == .masculine:
            return .anStem

        // ōn-Stem feminine (ends with "ōn")
        case let (end, gen) where end.hasSuffix("ōn") && gen == .feminine:
            return .onStem

        // īn-Stem feminine (ends with "īn")
        case let (end, gen) where end.hasSuffix("īn") && gen == .feminine:
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
