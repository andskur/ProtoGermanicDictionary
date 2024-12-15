//
//  ParticipleInflection.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 14/12/2024.
//

import Foundation

class ParticipleInflectionService {
    /// Generates verb inflections based on verb class and title.
    static func inflect(
        verbClass: VerbClass,
        for tense: GrammaticalTense,
        number: GrammaticalNumber,
        grammaticalCase: GrammaticalCase,
        gender: GrammaticalGender,
        decl: AdjectiveDeclension,
        word: String
    ) -> String {
        let root = participleForm(tense: tense, verbClass: verbClass, word: word)
        
        if root == "" || root == "-" {
            return "-"
        }
        
        switch tense {
        case .present:
            return inflectPresent(
                verbClass: verbClass,
                number: number,
                grammaticalCase: grammaticalCase,
                gender: gender,
                decl: decl,
                root: String(root.dropLast())
            )
        case .past:
            return inflectPast(
                verbClass: verbClass,
                number: number,
                grammaticalCase: grammaticalCase,
                gender: gender,
                decl: decl,
                root: String(root.dropLast(2))
                )
        }
    }
    
    private static func inflectPresent(
        verbClass: VerbClass,
        number: GrammaticalNumber,
        grammaticalCase: GrammaticalCase,
        gender: GrammaticalGender,
        decl: AdjectiveDeclension,
        root: String
    ) -> String {
        switch (grammaticalCase, number, gender, decl) {
        case (.nominative, .singular, .masculine, .strong): return root + "z"
        case (.accusative, .singular, .masculine, .strong): return root + "ų"
        case (.genitive, .singular, .masculine, .strong): return root + "iz"
        case (.dative, .singular, .masculine, .strong): return root + "i"
        case (.instrumental, .singular, .masculine, .strong): return root + "ē"
            
        case (.nominative, .singular, .feminine, .strong): return root + "ī"
        case (.accusative, .singular, .feminine, .strong): return root + "ijǭ"
        case (.genitive, .singular, .feminine, .strong): return root + "ijōz"
        case (.dative, .singular, .feminine, .strong): return root + "ijōi"
        case (.instrumental, .singular, .feminine, .strong): return root + "ijō"
            
        case (.nominative, .singular, .neuter, .strong): return root
        case (.accusative, .singular, .neuter, .strong): return root
        case (.genitive, .singular, .neuter, .strong): return root + "iz"
        case (.dative, .singular, .neuter, .strong): return root + "i"
        case (.instrumental, .singular, .neuter, .strong): return root + "ē"
            
        case (.nominative, .plural, .masculine, .strong): return root + "iz"
        case (.accusative, .plural, .masculine, .strong): return root + "unz"
        case (.genitive, .plural, .masculine, .strong): return root + "ǫ̂"
        case (.dative, .plural, .masculine, .strong): return root + "umaz"
        case (.instrumental, .plural, .masculine, .strong): return root + "umiz"
            
        case (.nominative, .plural, .feminine, .strong): return root + "ijôz"
        case (.accusative, .plural, .feminine, .strong): return root + "ijōz"
        case (.genitive, .plural, .feminine, .strong): return root + "ijǫ̂"
        case (.dative, .plural, .feminine, .strong): return root + "ijōmaz"
        case (.instrumental, .plural, .feminine, .strong): return root + "ijōmiz"
            
        case (.nominative, .plural, .neuter, .strong): return root
        case (.accusative, .plural, .neuter, .strong): return root
        case (.genitive, .plural, .neuter, .strong): return root + "ǫ̂"
        case (.dative, .plural, .neuter, .strong): return root + "umaz"
        case (.instrumental, .plural, .neuter, .strong): return root + "umiz"
            
        default: return "-"
        }
    }
    
    private static func inflectPast(
        verbClass: VerbClass,
        number: GrammaticalNumber,
        grammaticalCase: GrammaticalCase,
        gender: GrammaticalGender,
        decl: AdjectiveDeclension,
        root: String
    ) -> String {
        
        
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
        default:
            return "-"
            
        }
    }
    
    
    static func participleForm(tense: GrammaticalTense, verbClass: VerbClass, word: String) -> String {
        switch tense {
        case .present:
            return participleFormPresent(verbClass: verbClass, word: word)
        case .past:
            return participleFormPast(verbClass: verbClass, word: word)
        }
    }
    
    private static func participleFormPresent(verbClass: VerbClass, word: String) -> String {
        switch verbClass {
        case .strongClass1, .strongClass2, .strongClass3, .strongClass4, .strongClass5, .strongClass6, .strongClass7, .weakClass1, .weakClass2, .weakClass3, .weakClass4, .preteritePresent:
            return String(word.dropLast()) + "dz"
        case .irregular:
            guard let irregularVerb = IrregularVerbStore.shared.getVerb(baseForm: word) else {
                return "-"
            }
            
            return irregularVerb.participles[.present] ?? "-"
        default:
            return "-"
        }
    }
    
    private static func participleFormPast(verbClass: VerbClass, word: String) -> String {
        switch verbClass {
        case .strongClass1:
            return String(word.dropLast()).replacingOccurrences(of: "ī", with: "i") + "az"
        case .strongClass2:
            return String(word.dropLast()).replacingOccurrences(of: "eu", with: "u") + "az"
        case .strongClass3:
            for (_, char) in word.enumerated() {
                if char == "i" {
                    return String(word.dropLast()).replacingOccurrences(of: "i", with: "u") + "az"
                }
                
                if char == "e" {
                    return String(word.dropLast()).replacingOccurrences(of: "e", with: "u") + "az"
                }
            }
        case .strongClass4:
            return String(word.dropLast()).replacingOccurrences(of: "e", with: "u") + "az"
        case .strongClass5, .strongClass6, .strongClass7:
            return String(word.dropLast()) + "az"
        case .weakClass1:
            return String(word.dropLast(4) + "daz")
        case .weakClass2:
            return String(word.dropLast(2) + "daz")
        case .weakClass3:
            return String(word.dropLast(3) + "adaz")
        case .weakClass4:
            return "-"
        case .preteritePresent:
            return pretitePersistentPastForm(word: word) + "az"
        case .irregular:
            guard let irregularVerb = IrregularVerbStore.shared.getVerb(baseForm: word) else {
                return "-"
            }
            
            return irregularVerb.participles[.past] ?? "-"
        default:
            return "-"
        }
        
        return word
    }
    
    
    static func pretitePersistentPastForm(word: String) -> String {
        var aiPattern = false
        
        var stem = String(word.dropLast(3))
        for (_, char) in stem.enumerated() {
            if char == "i" {
                aiPattern = true
                break
            }
        }
        
        if aiPattern {
            stem = stem.dropLast() + "s"
            
            if stem.first == "w" {
                stem = stem + "s"
            }
            
            if stem.first == "l" {
                stem = stem + "t"
            }
        } else if stem.first == "þ" {
            stem = stem.dropLast() + "ft"
            
        } else {
            if stem.last == "g" {
                stem = stem.dropLast() + "h"
            }
            
            if stem.last == "h" {
                stem = stem + "t"
            }
            
            if stem.last == "n" && stem.dropLast(1).last == "n" {
               stem = stem.dropLast(1) + "þ"
            }
            
            if stem.last == "z" && stem.dropLast().last == "r" {
                stem = stem.dropLast() + "st"
            }
            
            if stem.first == "m" && stem.last == "t" {
                stem = stem.dropLast() + "s"
            }
            
            if stem.hasPrefix("skul") || stem.hasPrefix("mun") {
                stem = stem + "d"
            }
        }
        
        return stem
    }
    
}
