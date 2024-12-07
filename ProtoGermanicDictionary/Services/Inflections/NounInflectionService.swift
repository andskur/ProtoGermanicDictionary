//
//  NounInflectionService.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 07/12/2024.
//

import Foundation

class NounInflectionService {
    /// Generates inflections for a noun based on its grammatical case, number, and gender.
    static func inflect(
        nounStem: NounStem,
        grammaticalCase: GrammaticalCase,
        number: GrammaticalNumber,
        gender: GrammaticalGender,
        word: String
    ) -> String {
        let root = extractBaseForm(from: word, gender: gender, stem: nounStem)

        switch nounStem {
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
        case .anStem:
            return anStemInflection(for: grammaticalCase, number: number, root: root, gender: gender)
        case .inStem:
            return inStemInflection(for: grammaticalCase, number: number, root: root)
        case .onStem:
            return onStemInflection(for: grammaticalCase, number: number, root: root)
        case .rStem:
            return rStemInflection(for: grammaticalCase, number: number, root: root)
        case .zStem:
            return zStemInflection(for: grammaticalCase, number: number, root: root)
        case .consonantStem:
            return consonantStemInflection(for: grammaticalCase, number: number, root: root)
        default:
            return "-"
        }
    }
    
    
    // Method to extract base form depending on the noun stem, case, and gender
    static func extractBaseForm(from title: String, gender: GrammaticalGender, stem: NounStem) -> String {
        var root = title

        // Apply different rules depending on the noun stem type and gender
        switch stem {
        case .aStem, .jaStem, .iStem, .uStem:
            // For neuter nouns, drop 1 character; otherwise, drop 2
            root = gender == .neuter ? String(root.dropLast(1)) : String(root.dropLast(2))
        case .oStem, .ijStem, .anStem:
            root = String(root.dropLast(1)) // Drop 1 character for feminine o-stems and ī/jō-stem
        case .onStem, .inStem:
            root = String(root.dropLast(1)) // Drop 1 characters for these stems
        case .rStem, .zStem:
            root = String(root.dropLast(2)) // Drop 2 character for r-stems
        case .consonantStem:
            root = String(root.dropLast(1))
            break
        default:
            break
        }

        return root
    }
    
    // Example method for the a-stem noun inflections
    static private func aStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender) -> String {
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
    static private func jaStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender) -> String {
        switch (grammaticalCase, number, gender) {
        case (.vocative, .singular, .masculine) : return root.dropLast(1) + "i"
        default: return aStemInflection(for: grammaticalCase, number: number, root: root, gender: gender)
        }
    }
    
    static private func oStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String) -> String {
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
        default: return "-"
        }
    }
    
    static private func ijStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String) -> String {
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
        default: return "-"
        }
    }

    static private func iStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender) -> String {
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
        default: return "-"
        }
    }

    static private func uStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender) -> String {
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
        default: return "-"
        }
    }

    static private func anStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender) -> String {
        switch (grammaticalCase, number, gender) {
            
            // Nominative
        case (.nominative, .singular, _):
            return root + "ô"
        case (.nominative, .plural, .masculine):
            return root + "aniz"
        case (.nominative, .plural, .neuter):
            return root + "ōnō"
            
            // Vocative
        case (.vocative, .singular, _):
            return root + "ô"
        case (.vocative, .plural, .masculine):
            return root + "aniz"
        case (.vocative, .plural, .neuter):
            return root + "ōnō"
            
            // Accusative
        case (.accusative, .singular, .masculine):
            return root + "anų"
        case (.accusative, .plural, .masculine):
            return root + "anunz"
        case (.accusative, .singular, .neuter):
            return root + "ô"
        case (.accusative, .plural, .neuter):
            return root + "ōnō"
            
            // Genitive
        case (.genitive, .singular, _):
            return root + "iniz"
        case (.genitive, .plural, _):
            return root + "anǫ̂"
            
            // Dative
        case (.dative, .singular, _):
            return root + "ini"
        case (.dative, .plural, _):
            return root + "ammaz"
            
            // Instrumental
        case (.instrumental, .singular, _):
            return root + "inē"
        case (.instrumental, .plural, _):
            return root + "ammiz"
            
        // Default
        default: return "-"
        }
    }
    
    static private func onStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String) -> String {
        switch (grammaticalCase, number) {
        case (.nominative, .singular): return root + "ǭ"
        case (.nominative, .plural): return root + "ōniz"
        case (.vocative, .singular): return root + "ǭ"
        case (.vocative, .plural): return root + "ōniz"
        case (.accusative, .singular): return root + "ōnų"
        case (.accusative, .plural): return root + "ōnunz"
        case (.genitive, .singular): return root + "ōniz"
        case (.genitive, .plural): return root + "ōnǫ̂"
        case (.dative, .singular): return root + "ōni"
        case (.dative, .plural): return root + "ōmaz"
        case (.instrumental, .singular): return root + "ōnē"
        case (.instrumental, .plural): return root + "ōmiz"
        default: return "-"
        }
    }

    static private func inStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String) -> String {
        switch (grammaticalCase, number) {
        case (.nominative, .singular): return root + "į̄"
        case (.nominative, .plural): return root + "īniz"
        case (.vocative, .singular): return root + "į̄"
        case (.vocative, .plural): return root + "īniz"
        case (.accusative, .singular): return root + "īnų"
        case (.accusative, .plural): return root + "īnunz"
        case (.genitive, .singular): return root + "īniz"
        case (.genitive, .plural): return root + "īnǫ̂"
        case (.dative, .singular): return root + "īni"
        case (.dative, .plural): return root + "īmaz"
        case (.instrumental, .singular): return root + "īnē"
        case (.instrumental, .plural): return root + "īmiz"
        default: return "-"
        }
    }

    static private func rStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String) -> String {
        switch (grammaticalCase, number) {
        case (.nominative, .singular): return root + "ēr"
        case (.nominative, .plural): return root + "riz"
        case (.vocative, .singular): return root + "ēr"
        case (.vocative, .plural): return root + "riz"
        case (.accusative, .singular): return root + "erų"
        case (.accusative, .plural): return root + "runz"
        case (.genitive, .singular): return root + "urz"
        case (.genitive, .plural): return root + "rǫ̂"
        case (.dative, .singular): return root + "ri"
        case (.dative, .plural): return root + "rumaz"
        case (.instrumental, .singular): return root + "rē"
        case (.instrumental, .plural): return root + "rumiz"
        default: return "-"
        }
    }

    static private func zStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String) -> String {
        switch (grammaticalCase, number) {
        case (.nominative, .singular): return root + "az"
        case (.nominative, .plural): return root + "izō"
        case (.vocative, .singular): return root + "az"
        case (.vocative, .plural): return root + "izō"
        case (.accusative, .singular): return root + "az"
        case (.accusative, .plural): return root + "izō"
        case (.genitive, .singular): return root + "iziz"
        case (.genitive, .plural): return root + "izǫ̂"
        case (.dative, .singular): return root + "izi"
        case (.dative, .plural): return root + "izumaz"
        case (.instrumental, .singular): return root + "izē"
        case (.instrumental, .plural): return root + "izumiz"
        default: return "-"
        }
    }

    static private func consonantStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String) -> String {
        switch (grammaticalCase, number) {
        case (.nominative, .singular): return root + "s"
        case (.nominative, .plural): return root + "iz"
        case (.vocative, .singular): return root
        case (.vocative, .plural): return root + "iz"
        case (.accusative, .singular): return root + "ų"
        case (.accusative, .plural): return root + "unz"
        case (.genitive, .singular): return root + "iz"
        case (.genitive, .plural): return root + "ǫ̂"
        case (.dative, .singular): return root + "i"
        case (.dative, .plural): return root + "umaz"
        case (.instrumental, .singular): return root + "ē"
        case (.instrumental, .plural): return root + "umiz"
        default: return root
        }
    }
    
}
