//
//  NounInflectionService.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 07/12/2024.
//

import Foundation

class AdjectivesIflectionService {
    /// Generates inflections for a noun based on its grammatical case, number, and gender.
    static func inflect(
        adjectiveStem: AdjectivesStem,
        grammaticalCase: GrammaticalCase,
        number: GrammaticalNumber,
        gender: GrammaticalGender,
        word: String
    ) -> String {
        let root = extractBaseForm(from: word, stem: adjectiveStem)

        switch adjectiveStem {
        case .aStem:
            return aStemInflection(for: grammaticalCase, number: number, root: root, gender: gender)
        case .iStem:
            return iStemInflection(for: grammaticalCase, number: number, root: root, gender: gender)
        case .uStem:
            return uStemInflection(for: grammaticalCase, number: number, root: root, gender: gender)
        case .nStem:
            return nStemInflection(for: grammaticalCase, number: number, root: root, gender: gender)
        case .inStem:
            return inStemInflection(for: grammaticalCase, number: number, root: root, gender: gender)
        default:
            return "-"
        }
    }
    
    
    // Method to extract base form depending on the noun stem, case, and gender
    static func extractBaseForm(from title: String, stem: AdjectivesStem) -> String {
        var root = title

        switch stem {
        case .aStem, .iStem, .uStem:
            root = String(root.dropLast(2))
        case .nStem, .inStem:
            root = String(root.dropLast(1))
        default:
            break
        }

        return root
    }
    
    // Example method for the a-stem noun inflections
    static private func aStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender) -> String {
        switch (grammaticalCase, number, gender) {
        case (.nominative, .singular, .masculine): return root + "az"
        case (.accusative, .singular, .masculine): return root + "anǭ"
        case (.genitive, .singular, .masculine): return root + "as"
        case (.dative, .singular, .masculine): return root + "ammai"
        case (.instrumental, .singular, .masculine): return root + "anō"
            
        case (.nominative, .singular, .feminine): return root + "ō"
        case (.accusative, .singular, .feminine): return root + "ǭ"
        case (.genitive, .singular, .feminine): return root + "aizōz"
        case (.dative, .singular, .feminine): return root + "aizōi"
        case (.instrumental, .singular, .feminine): return root + "aizō"
            
        case (.nominative, .singular, .neuter): return root + "ą"
        case (.accusative, .singular, .neuter): return root + "ą"
        case (.genitive, .singular, .neuter): return root + "as"
        case (.dative, .singular, .neuter): return root + "ammai"
        case (.instrumental, .singular, .neuter): return root + "anō"
            
        case (.nominative, .plural, .masculine): return root + "ai"
        case (.accusative, .plural, .masculine): return root + "anz"
        case (.genitive, .plural, .masculine): return root + "aizǫ̂"
        case (.dative, .plural, .masculine): return root + "aimaz"
        case (.instrumental, .plural, .masculine): return root + "aimiz"
            
        case (.nominative, .plural, .feminine): return root + "ôz"
        case (.accusative, .plural, .feminine): return root + "ōz"
        case (.genitive, .plural, .feminine): return root + "aizǫ̂"
        case (.dative, .plural, .feminine): return root + "aimaz"
        case (.instrumental, .plural, .feminine): return root + "aimiz"
            
        case (.nominative, .plural, .neuter): return root + "ō"
        case (.accusative, .plural, .neuter): return root + "ō"
        case (.genitive, .plural, .neuter): return root + "aizǫ̂"
        case (.dative, .plural, .neuter): return root + "aimaz"
        case (.instrumental, .plural, .neuter): return root + "aimiz"

        // Default
        default: return "-"
        }
    }

    static private func iStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender) ->  String {
        switch (grammaticalCase, number, gender) {
        case (.nominative, .singular, .masculine): return root + "iz"
        case (.accusative, .singular, .masculine): return root + "ijanǭ"
        case (.genitive, .singular, .masculine): return root + "ijas"
        case (.dative, .singular, .masculine): return root + "ijammai"
        case (.instrumental, .singular, .masculine): return root + "ijanō"
            
        case (.nominative, .singular, .feminine): return root + "ī"
        case (.accusative, .singular, .feminine): return root + "jǭ"
        case (.genitive, .singular, .feminine): return root + "ijaizōz"
        case (.dative, .singular, .feminine): return root + "ijaizōi"
        case (.instrumental, .singular, .feminine): return root + "ijaizō"
            
        case (.nominative, .singular, .neuter): return root + "į"
        case (.accusative, .singular, .neuter): return root + "į"
        case (.genitive, .singular, .neuter): return root + "ijas"
        case (.dative, .singular, .neuter): return root + "ijammai"
        case (.instrumental, .singular, .neuter): return root + "ijanō"
            
        case (.nominative, .plural, .masculine): return root + "ijai"
        case (.accusative, .plural, .masculine): return root + "ijanz"
        case (.genitive, .plural, .masculine): return root + "ijaizǫ̂"
        case (.dative, .plural, .masculine): return root + "ijaimaz"
        case (.instrumental, .plural, .masculine): return root + "ijaimiz"
            
        case (.nominative, .plural, .feminine): return root + "ijôz"
        case (.accusative, .plural, .feminine): return root + "ijōz"
        case (.genitive, .plural, .feminine): return root + "ijaizǫ̂"
        case (.dative, .plural, .feminine): return root + "ijaimaz"
        case (.instrumental, .plural, .feminine): return root + "ijaimiz"
            
        case (.nominative, .plural, .neuter): return root + "ijō"
        case (.accusative, .plural, .neuter): return root + "ijō"
        case (.genitive, .plural, .neuter): return root + "ijaizǫ̂"
        case (.dative, .plural, .neuter): return root + "ijaimaz"
        case (.instrumental, .plural, .neuter): return root + "ijaimiz"

        // Default
        default: return "-"
        }

    }

    static private func uStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender) -> String {
        switch (grammaticalCase, number, gender) {
        case (.nominative, .singular, .masculine): return root + "uz"
        case (.accusative, .singular, .masculine): return root + "ijanǭ"
        case (.genitive, .singular, .masculine): return root + "ijas"
        case (.dative, .singular, .masculine): return root + "ijammai"
        case (.instrumental, .singular, .masculine): return root + "ijanō"
            
        case (.nominative, .singular, .feminine): return root + "ī"
        case (.accusative, .singular, .feminine): return root + "jǭ"
        case (.genitive, .singular, .feminine): return root + "ijaizōz"
        case (.dative, .singular, .feminine): return root + "ijaizōi"
        case (.instrumental, .singular, .feminine): return root + "ijaizō"
            
        case (.nominative, .singular, .neuter): return root + "ų"
        case (.accusative, .singular, .neuter): return root + "ų"
        case (.genitive, .singular, .neuter): return root + "ijas"
        case (.dative, .singular, .neuter): return root + "ijammai"
        case (.instrumental, .singular, .neuter): return root + "ijanō"
            
        case (.nominative, .plural, .masculine): return root + "ijai"
        case (.accusative, .plural, .masculine): return root + "ijanz"
        case (.genitive, .plural, .masculine): return root + "ijaizǫ̂"
        case (.dative, .plural, .masculine): return root + "ijaimaz"
        case (.instrumental, .plural, .masculine): return root + "ijaimiz"
            
        case (.nominative, .plural, .feminine): return root + "ijôz"
        case (.accusative, .plural, .feminine): return root + "ijōz"
        case (.genitive, .plural, .feminine): return root + "ijaizǫ̂"
        case (.dative, .plural, .feminine): return root + "ijaimaz"
        case (.instrumental, .plural, .feminine): return root + "ijaimiz"
            
        case (.nominative, .plural, .neuter): return root + "ijō"
        case (.accusative, .plural, .neuter): return root + "ijō"
        case (.genitive, .plural, .neuter): return root + "ijaizǫ̂"
        case (.dative, .plural, .neuter): return root + "ijaimaz"
        case (.instrumental, .plural, .neuter): return root + "ijaimiz"

        // Default
        default: return "-"
        }
    }

    static private func nStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender) -> String {
        switch (grammaticalCase, number, gender) {
        case (.nominative, .singular, .masculine): return root + "ô"
        case (.accusative, .singular, .masculine): return root + "anų"
        case (.genitive, .singular, .masculine): return root + "iniz"
        case (.dative, .singular, .masculine): return root + "ini"
        case (.instrumental, .singular, .masculine): return root + "inē"
            
        case (.nominative, .singular, .feminine): return root + "ǭ"
        case (.accusative, .singular, .feminine): return root + "ōnų"
        case (.genitive, .singular, .feminine): return root + "ōniz"
        case (.dative, .singular, .feminine): return root + "ōni"
        case (.instrumental, .singular, .feminine): return root + "ōnē"
            
        case (.nominative, .singular, .neuter): return root + "ô"
        case (.accusative, .singular, .neuter): return root + "ô"
        case (.genitive, .singular, .neuter): return root + "iniz"
        case (.dative, .singular, .neuter): return root + "ini"
        case (.instrumental, .singular, .neuter): return root + "inē"
            
        case (.nominative, .plural, .masculine): return root + "aniz"
        case (.accusative, .plural, .masculine): return root + "anunz"
        case (.genitive, .plural, .masculine): return root + "anǫ̂"
        case (.dative, .plural, .masculine): return root + "ammaz"
        case (.instrumental, .plural, .masculine): return root + "ammiz"
            
        case (.nominative, .plural, .feminine): return root + "ōniz"
        case (.accusative, .plural, .feminine): return root + "ōnunz"
        case (.genitive, .plural, .feminine): return root + "ōnǫ̂"
        case (.dative, .plural, .feminine): return root + "ōmaz"
        case (.instrumental, .plural, .feminine): return root + "ōmiz"
            
        case (.nominative, .plural, .neuter): return root + "ōnō"
        case (.accusative, .plural, .neuter): return root + "ōnō"
        case (.genitive, .plural, .neuter): return root + "anǫ̂"
        case (.dative, .plural, .neuter): return root + "ammaz"
        case (.instrumental, .plural, .neuter): return root + "ammiz"

        // Default
        default: return "-"
        }
    }
    
    static private func inStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender) -> String {
        switch (grammaticalCase, number, gender) {
        case (.nominative, .singular, .masculine): return root + "ô"
        case (.accusative, .singular, .masculine): return root + "anų"
        case (.genitive, .singular, .masculine): return root + "iniz"
        case (.dative, .singular, .masculine): return root + "ini"
        case (.instrumental, .singular, .masculine): return root + "inē"
            
        case (.nominative, .singular, .feminine): return root + "į̄"
        case (.accusative, .singular, .feminine): return root + "īnų"
        case (.genitive, .singular, .feminine): return root + "īniz"
        case (.dative, .singular, .feminine): return root + "īni"
        case (.instrumental, .singular, .feminine): return root + "īnē"
            
        case (.nominative, .singular, .neuter): return root + "ô"
        case (.accusative, .singular, .neuter): return root + "ô"
        case (.genitive, .singular, .neuter): return root + "iniz"
        case (.dative, .singular, .neuter): return root + "ini"
        case (.instrumental, .singular, .neuter): return root + "inē"
            
        case (.nominative, .plural, .masculine): return root + "aniz"
        case (.accusative, .plural, .masculine): return root + "anunz"
        case (.genitive, .plural, .masculine): return root + "anǫ̂"
        case (.dative, .plural, .masculine): return root + "ammaz"
        case (.instrumental, .plural, .masculine): return root + "ammiz"
            
        case (.nominative, .plural, .feminine): return root + "īniz"
        case (.accusative, .plural, .feminine): return root + "īnunz"
        case (.genitive, .plural, .feminine): return root + "īnǫ̂"
        case (.dative, .plural, .feminine): return root + "īmaz"
        case (.instrumental, .plural, .feminine): return root + "īmiz"
            
        case (.nominative, .plural, .neuter): return root + "ōnō"
        case (.accusative, .plural, .neuter): return root + "ōnō"
        case (.genitive, .plural, .neuter): return root + "anǫ̂"
        case (.dative, .plural, .neuter): return root + "ammaz"
        case (.instrumental, .plural, .neuter): return root + "ammiz"

        // Default
        default: return "-"
        }
    }
}
