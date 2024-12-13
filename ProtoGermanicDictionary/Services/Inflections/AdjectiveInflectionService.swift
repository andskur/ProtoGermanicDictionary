//
//  NounInflectionService.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 07/12/2024.
//

import Foundation

class AdjectiveInflectionService {
    /// Generates inflections for a noun based on its grammatical case, number, and gender.
    static func inflect(
        adjectiveStem: AdjectivesStem,
        grammaticalCase: GrammaticalCase,
        number: GrammaticalNumber,
        gender: GrammaticalGender,
        decl: AdjectiveDeclension,
        word: String
    ) -> String {
        let root = extractBaseForm(from: word, stem: adjectiveStem)

        switch adjectiveStem {
        case .aStem:
            return aStemInflection(for: grammaticalCase, number: number, root: root, gender: gender, decl: decl)
        case .iStem:
            return iStemInflection(for: grammaticalCase, number: number, root: root, gender: gender, decl: decl)
        case .uStem:
            return uStemInflection(for: grammaticalCase, number: number, root: root, gender: gender, decl: decl)
        case .nStem:
            return nStemInflection(for: grammaticalCase, number: number, root: root, gender: gender, decl: decl)
        case .inStem:
            return inStemInflection(for: grammaticalCase, number: number, root: root, gender: gender, decl: decl)
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
    static private func aStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender, decl: AdjectiveDeclension) -> String {
        switch (grammaticalCase, number, gender, decl) {
        case (.nominative, .singular, .masculine, .strong): return root + "az"
        case (.accusative, .singular, .masculine, .strong): return root + "anǭ"
        case (.genitive, .singular, .masculine, .strong): return root + "as"
        case (.dative, .singular, .masculine, .strong): return root + "ammai"
        case (.instrumental, .singular, .masculine, .strong): return root + "anō"
            
        case (.nominative, .singular, .feminine, .strong): return root + "ō"
        case (.accusative, .singular, .feminine, .strong): return root + "ǭ"
        case (.genitive, .singular, .feminine, .strong): return root + "aizōz"
        case (.dative, .singular, .feminine, .strong): return root + "aizōi"
        case (.instrumental, .singular, .feminine, .strong): return root + "aizō"
            
        case (.nominative, .singular, .neuter, .strong): return root + "ą"
        case (.accusative, .singular, .neuter, .strong): return root + "ą"
        case (.genitive, .singular, .neuter, .strong): return root + "as"
        case (.dative, .singular, .neuter, .strong): return root + "ammai"
        case (.instrumental, .singular, .neuter, .strong): return root + "anō"
            
        case (.nominative, .plural, .masculine, .strong): return root + "ai"
        case (.accusative, .plural, .masculine, .strong): return root + "anz"
        case (.genitive, .plural, .masculine, .strong): return root + "aizǫ̂"
        case (.dative, .plural, .masculine, .strong): return root + "aimaz"
        case (.instrumental, .plural, .masculine, .strong): return root + "aimiz"
            
        case (.nominative, .plural, .feminine, .strong): return root + "ôz"
        case (.accusative, .plural, .feminine, .strong): return root + "ōz"
        case (.genitive, .plural, .feminine, .strong): return root + "aizǫ̂"
        case (.dative, .plural, .feminine, .strong): return root + "aimaz"
        case (.instrumental, .plural, .feminine, .strong): return root + "aimiz"
            
        case (.nominative, .plural, .neuter, .strong): return root + "ō"
        case (.accusative, .plural, .neuter, .strong): return root + "ō"
        case (.genitive, .plural, .neuter, .strong): return root + "aizǫ̂"
        case (.dative, .plural, .neuter, .strong): return root + "aimaz"
        case (.instrumental, .plural, .neuter, .strong): return root + "aimiz"
            
        // weak declension
        case (.nominative, .singular, .masculine, .weak): return root + "ô"
        case (.accusative, .singular, .masculine, .weak): return root + "anų"
        case (.genitive, .singular, .masculine, .weak): return root + "iniz"
        case (.dative, .singular, .masculine, .weak): return root + "ini"
        case (.instrumental, .singular, .masculine, .weak): return root + "inē"
            
        case (.nominative, .singular, .feminine, .weak): return root + "ǭ"
        case (.accusative, .singular, .feminine, .weak): return root + "ōnų"
        case (.genitive, .singular, .feminine, .weak): return root + "ōniz"
        case (.dative, .singular, .feminine, .weak): return root + "ōni"
        case (.instrumental, .singular, .feminine, .weak): return root + "ōnē"
            
        case (.nominative, .singular, .neuter, .weak): return root + "ô"
        case (.accusative, .singular, .neuter, .weak): return root + "ô"
        case (.genitive, .singular, .neuter, .weak): return root + "iniz"
        case (.dative, .singular, .neuter, .weak): return root + "ini"
        case (.instrumental, .singular, .neuter, .weak): return root + "inē"
            
        case (.nominative, .plural, .masculine, .weak): return root + "aniz"
        case (.accusative, .plural, .masculine, .weak): return root + "anunz"
        case (.genitive, .plural, .masculine, .weak): return root + "anǫ̂"
        case (.dative, .plural, .masculine, .weak): return root + "ammaz"
        case (.instrumental, .plural, .masculine, .weak): return root + "ammiz"
            
        case (.nominative, .plural, .feminine, .weak): return root + "ōniz"
        case (.accusative, .plural, .feminine, .weak): return root + "ōnunz"
        case (.genitive, .plural, .feminine, .weak): return root + "ōnǫ̂"
        case (.dative, .plural, .feminine, .weak): return root + "ōmaz"
        case (.instrumental, .plural, .feminine, .weak): return root + "ōmiz"
            
        case (.nominative, .plural, .neuter, .weak): return root + "ōnō"
        case (.accusative, .plural, .neuter, .weak): return root + "ōnō"
        case (.genitive, .plural, .neuter, .weak): return root + "anǫ̂"
        case (.dative, .plural, .neuter, .weak): return root + "ammaz"
        case (.instrumental, .plural, .neuter, .weak): return root + "ammiz"

        // Default
        default: return "-"
        }
    }

    static private func iStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender, decl: AdjectiveDeclension) ->  String {
        switch (grammaticalCase, number, gender, decl) {
        case (.nominative, .singular, .masculine, .strong): return root + "iz"
        case (.accusative, .singular, .masculine, .strong): return root + "ijanǭ"
        case (.genitive, .singular, .masculine, .strong): return root + "ijas"
        case (.dative, .singular, .masculine, .strong): return root + "ijammai"
        case (.instrumental, .singular, .masculine, .strong): return root + "ijanō"
            
        case (.nominative, .singular, .feminine, .strong): return root + "ī"
        case (.accusative, .singular, .feminine, .strong): return root + "ijǭ"
        case (.genitive, .singular, .feminine, .strong): return root + "ijaizōz"
        case (.dative, .singular, .feminine, .strong): return root + "ijaizōi"
        case (.instrumental, .singular, .feminine, .strong): return root + "ijaizō"
            
        case (.nominative, .singular, .neuter, .strong): return root + "į"
        case (.accusative, .singular, .neuter, .strong): return root + "į"
        case (.genitive, .singular, .neuter, .strong): return root + "ijas"
        case (.dative, .singular, .neuter, .strong): return root + "ijammai"
        case (.instrumental, .singular, .neuter, .strong): return root + "ijanō"
            
        case (.nominative, .plural, .masculine, .strong): return root + "ijai"
        case (.accusative, .plural, .masculine, .strong): return root + "ijanz"
        case (.genitive, .plural, .masculine, .strong): return root + "ijaizǫ̂"
        case (.dative, .plural, .masculine, .strong): return root + "ijaimaz"
        case (.instrumental, .plural, .masculine, .strong): return root + "ijaimiz"
            
        case (.nominative, .plural, .feminine, .strong): return root + "ijôz"
        case (.accusative, .plural, .feminine, .strong): return root + "ijōz"
        case (.genitive, .plural, .feminine, .strong): return root + "ijaizǫ̂"
        case (.dative, .plural, .feminine, .strong): return root + "ijaimaz"
        case (.instrumental, .plural, .feminine, .strong): return root + "ijaimiz"
            
        case (.nominative, .plural, .neuter, .strong): return root + "ijō"
        case (.accusative, .plural, .neuter, .strong): return root + "ijō"
        case (.genitive, .plural, .neuter, .strong): return root + "ijaizǫ̂"
        case (.dative, .plural, .neuter, .strong): return root + "ijaimaz"
        case (.instrumental, .plural, .neuter, .strong): return root + "ijaimiz"
            
        // weak declension
        case (.nominative, .singular, .masculine, .weak): return root + "ijô"
        case (.accusative, .singular, .masculine, .weak): return root + "ijanų"
        case (.genitive, .singular, .masculine, .weak): return root + "īniz"
        case (.dative, .singular, .masculine, .weak): return root + "īni"
        case (.instrumental, .singular, .masculine, .weak): return root + "īnē"
            
        case (.nominative, .singular, .feminine, .weak): return root + "ijǭ"
        case (.accusative, .singular, .feminine, .weak): return root + "ijōnų"
        case (.genitive, .singular, .feminine, .weak): return root + "ijōniz"
        case (.dative, .singular, .feminine, .weak): return root + "ijōni"
        case (.instrumental, .singular, .feminine, .weak): return root + "ijōnē"
            
        case (.nominative, .singular, .neuter, .weak): return root + "ijô"
        case (.accusative, .singular, .neuter, .weak): return root + "ijô"
        case (.genitive, .singular, .neuter, .weak): return root + "īniz"
        case (.dative, .singular, .neuter, .weak): return root + "īni"
        case (.instrumental, .singular, .neuter, .weak): return root + "īnē"
            
        case (.nominative, .plural, .masculine, .weak): return root + "ijaniz"
        case (.accusative, .plural, .masculine, .weak): return root + "ijanunz"
        case (.genitive, .plural, .masculine, .weak): return root + "ijanǫ̂"
        case (.dative, .plural, .masculine, .weak): return root + "ijammaz"
        case (.instrumental, .plural, .masculine, .weak): return root + "ijammiz"
            
        case (.nominative, .plural, .feminine, .weak): return root + "ijōniz"
        case (.accusative, .plural, .feminine, .weak): return root + "ijōnunz"
        case (.genitive, .plural, .feminine, .weak): return root + "ijōnǫ̂"
        case (.dative, .plural, .feminine, .weak): return root + "ijōmaz"
        case (.instrumental, .plural, .feminine, .weak): return root + "ijōmiz"
            
        case (.nominative, .plural, .neuter, .weak): return root + "ijōnō"
        case (.accusative, .plural, .neuter, .weak): return root + "ijōnō"
        case (.genitive, .plural, .neuter, .weak): return root + "ijanǫ̂"
        case (.dative, .plural, .neuter, .weak): return root + "ijammaz"
        case (.instrumental, .plural, .neuter, .weak): return root + "ijammiz"

        // Default
        default: return "-"
        }

    }

    static private func uStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender, decl: AdjectiveDeclension) -> String {
        switch (grammaticalCase, number, gender, decl) {
        case (.nominative, .singular, .masculine, .strong): return root + "uz"
        case (.accusative, .singular, .masculine, .strong): return root + "ijanǭ"
        case (.genitive, .singular, .masculine, .strong): return root + "ijas"
        case (.dative, .singular, .masculine, .strong): return root + "ijammai"
        case (.instrumental, .singular, .masculine, .strong): return root + "ijanō"
            
        case (.nominative, .singular, .feminine, .strong): return root + "ī"
        case (.accusative, .singular, .feminine, .strong): return root + "ijǭ"
        case (.genitive, .singular, .feminine, .strong): return root + "ijaizōz"
        case (.dative, .singular, .feminine, .strong): return root + "ijaizōi"
        case (.instrumental, .singular, .feminine, .strong): return root + "ijaizō"
            
        case (.nominative, .singular, .neuter, .strong): return root + "ų"
        case (.accusative, .singular, .neuter, .strong): return root + "ų"
        case (.genitive, .singular, .neuter, .strong): return root + "ijas"
        case (.dative, .singular, .neuter, .strong): return root + "ijammai"
        case (.instrumental, .singular, .neuter, .strong): return root + "ijanō"
            
        case (.nominative, .plural, .masculine, .strong): return root + "ijai"
        case (.accusative, .plural, .masculine, .strong): return root + "ijanz"
        case (.genitive, .plural, .masculine, .strong): return root + "ijaizǫ̂"
        case (.dative, .plural, .masculine, .strong): return root + "ijaimaz"
        case (.instrumental, .plural, .masculine, .strong): return root + "ijaimiz"
            
        case (.nominative, .plural, .feminine, .strong): return root + "ijôz"
        case (.accusative, .plural, .feminine, .strong): return root + "ijōz"
        case (.genitive, .plural, .feminine, .strong): return root + "ijaizǫ̂"
        case (.dative, .plural, .feminine, .strong): return root + "ijaimaz"
        case (.instrumental, .plural, .feminine, .strong): return root + "ijaimiz"
            
        case (.nominative, .plural, .neuter, .strong): return root + "ijō"
        case (.accusative, .plural, .neuter, .strong): return root + "ijō"
        case (.genitive, .plural, .neuter, .strong): return root + "ijaizǫ̂"
        case (.dative, .plural, .neuter, .strong): return root + "ijaimaz"
        case (.instrumental, .plural, .neuter, .strong): return root + "ijaimiz"
            
        // weak declension
        case (.nominative, .singular, .masculine, .weak): return root + "ijô"
        case (.accusative, .singular, .masculine, .weak): return root + "ijanų"
        case (.genitive, .singular, .masculine, .weak): return root + "īniz"
        case (.dative, .singular, .masculine, .weak): return root + "īni"
        case (.instrumental, .singular, .masculine, .weak): return root + "īnē"
            
        case (.nominative, .singular, .feminine, .weak): return root + "ijǭ"
        case (.accusative, .singular, .feminine, .weak): return root + "ijōnų"
        case (.genitive, .singular, .feminine, .weak): return root + "ijōniz"
        case (.dative, .singular, .feminine, .weak): return root + "ijōni"
        case (.instrumental, .singular, .feminine, .weak): return root + "ijōnē"
            
        case (.nominative, .singular, .neuter, .weak): return root + "ijô"
        case (.accusative, .singular, .neuter, .weak): return root + "ijô"
        case (.genitive, .singular, .neuter, .weak): return root + "īniz"
        case (.dative, .singular, .neuter, .weak): return root + "īni"
        case (.instrumental, .singular, .neuter, .weak): return root + "īnē"
            
        case (.nominative, .plural, .masculine, .weak): return root + "ijaniz"
        case (.accusative, .plural, .masculine, .weak): return root + "ijanunz"
        case (.genitive, .plural, .masculine, .weak): return root + "ijanǫ̂"
        case (.dative, .plural, .masculine, .weak): return root + "ijammaz"
        case (.instrumental, .plural, .masculine, .weak): return root + "ijammiz"
            
        case (.nominative, .plural, .feminine, .weak): return root + "ijōniz"
        case (.accusative, .plural, .feminine, .weak): return root + "ijōnunz"
        case (.genitive, .plural, .feminine, .weak): return root + "ijōnǫ̂"
        case (.dative, .plural, .feminine, .weak): return root + "ijōmaz"
        case (.instrumental, .plural, .feminine, .weak): return root + "ijōmiz"
            
        case (.nominative, .plural, .neuter, .weak): return root + "ijōnō"
        case (.accusative, .plural, .neuter, .weak): return root + "ijōnō"
        case (.genitive, .plural, .neuter, .weak): return root + "ijanǫ̂"
        case (.dative, .plural, .neuter, .weak): return root + "ijammaz"
        case (.instrumental, .plural, .neuter, .weak): return root + "ijammiz"

        // Default
        default: return "-"
        }
    }

    static private func nStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender, decl: AdjectiveDeclension) -> String {
        switch (grammaticalCase, number, gender, decl) {
        case (.nominative, .singular, .masculine, .weak): return root + "ô"
        case (.accusative, .singular, .masculine, .weak): return root + "anų"
        case (.genitive, .singular, .masculine, .weak): return root + "iniz"
        case (.dative, .singular, .masculine, .weak): return root + "ini"
        case (.instrumental, .singular, .masculine, .weak): return root + "inē"
            
        case (.nominative, .singular, .feminine, .weak): return root + "ǭ"
        case (.accusative, .singular, .feminine, .weak): return root + "ōnų"
        case (.genitive, .singular, .feminine, .weak): return root + "ōniz"
        case (.dative, .singular, .feminine, .weak): return root + "ōni"
        case (.instrumental, .singular, .feminine, .weak): return root + "ōnē"
            
        case (.nominative, .singular, .neuter, .weak): return root + "ô"
        case (.accusative, .singular, .neuter, .weak): return root + "ô"
        case (.genitive, .singular, .neuter, .weak): return root + "iniz"
        case (.dative, .singular, .neuter, .weak): return root + "ini"
        case (.instrumental, .singular, .neuter, .weak): return root + "inē"
            
        case (.nominative, .plural, .masculine, .weak): return root + "aniz"
        case (.accusative, .plural, .masculine, .weak): return root + "anunz"
        case (.genitive, .plural, .masculine, .weak): return root + "anǫ̂"
        case (.dative, .plural, .masculine, .weak): return root + "ammaz"
        case (.instrumental, .plural, .masculine, .weak): return root + "ammiz"
            
        case (.nominative, .plural, .feminine, .weak): return root + "ōniz"
        case (.accusative, .plural, .feminine, .weak): return root + "ōnunz"
        case (.genitive, .plural, .feminine, .weak): return root + "ōnǫ̂"
        case (.dative, .plural, .feminine, .weak): return root + "ōmaz"
        case (.instrumental, .plural, .feminine, .weak): return root + "ōmiz"
            
        case (.nominative, .plural, .neuter, .weak): return root + "ōnō"
        case (.accusative, .plural, .neuter, .weak): return root + "ōnō"
        case (.genitive, .plural, .neuter, .weak): return root + "anǫ̂"
        case (.dative, .plural, .neuter, .weak): return root + "ammaz"
        case (.instrumental, .plural, .neuter, .weak): return root + "ammiz"

        // Default
        default: return "-"
        }
    }
    
    static private func inStemInflection(for grammaticalCase: GrammaticalCase, number: GrammaticalNumber, root: String, gender: GrammaticalGender, decl: AdjectiveDeclension) -> String {
        switch (grammaticalCase, number, gender, decl) {
        case (.nominative, .singular, .masculine, .weak): return root + "ô"
        case (.accusative, .singular, .masculine, .weak): return root + "anų"
        case (.genitive, .singular, .masculine, .weak): return root + "iniz"
        case (.dative, .singular, .masculine, .weak): return root + "ini"
        case (.instrumental, .singular, .masculine, .weak): return root + "inē"
            
        case (.nominative, .singular, .feminine, .weak): return root + "į̄"
        case (.accusative, .singular, .feminine, .weak): return root + "īnų"
        case (.genitive, .singular, .feminine, .weak): return root + "īniz"
        case (.dative, .singular, .feminine, .weak): return root + "īni"
        case (.instrumental, .singular, .feminine, .weak): return root + "īnē"
            
        case (.nominative, .singular, .neuter, .weak): return root + "ô"
        case (.accusative, .singular, .neuter, .weak): return root + "ô"
        case (.genitive, .singular, .neuter, .weak): return root + "iniz"
        case (.dative, .singular, .neuter, .weak): return root + "ini"
        case (.instrumental, .singular, .neuter, .weak): return root + "inē"
            
        case (.nominative, .plural, .masculine, .weak): return root + "aniz"
        case (.accusative, .plural, .masculine, .weak): return root + "anunz"
        case (.genitive, .plural, .masculine, .weak): return root + "anǫ̂"
        case (.dative, .plural, .masculine, .weak): return root + "ammaz"
        case (.instrumental, .plural, .masculine, .weak): return root + "ammiz"
            
        case (.nominative, .plural, .feminine, .weak): return root + "īniz"
        case (.accusative, .plural, .feminine, .weak): return root + "īnunz"
        case (.genitive, .plural, .feminine, .weak): return root + "īnǫ̂"
        case (.dative, .plural, .feminine, .weak): return root + "īmaz"
        case (.instrumental, .plural, .feminine, .weak): return root + "īmiz"
            
        case (.nominative, .plural, .neuter, .weak): return root + "ōnō"
        case (.accusative, .plural, .neuter, .weak): return root + "ōnō"
        case (.genitive, .plural, .neuter, .weak): return root + "anǫ̂"
        case (.dative, .plural, .neuter, .weak): return root + "ammaz"
        case (.instrumental, .plural, .neuter, .weak): return root + "ammiz"

        // Default
        default: return "-"
        }
    }
}
