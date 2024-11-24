//
//  VerbClass.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 06/11/2024.
//

import Foundation

enum VerbClass: String {
    case strongClass1 = "Strong Class I"
    case strongClass2 = "Strong Class II"
    case strongClass3 = "Strong Class III"
    case strongClass4 = "Strong Class IV"
    case strongClass5 = "Strong Class V"
    case strongClass6 = "Strong Class VI"
    case strongClass7 = "Strong Class VII"
    case weakClass1 = "Weak Class I"
    case weakClass2 = "Weak Class II"
    case weakClass3 = "Weak Class III"
    case weakClass4 = "Weak Class IV"
    case preteritePresent = "Preterite-Present"
    case irregular = "Irregular"
    case unknown = "Unknown"

    /// Extracts the base form of a verb, based on class-specific rules.
    private func extractBaseForm(from word: String) -> String {
        switch self {
        case .strongClass1, .strongClass2, .strongClass3, .strongClass4, .strongClass5, .strongClass6, .strongClass7:
            return String(word.dropLast(3))
        case .weakClass1:
            return String(word.dropLast(4))
        case .weakClass2, .weakClass3, .weakClass4:
            return String(word.dropLast(3))
        case .preteritePresent:
            return String(word.dropLast(3))
        default:
            return word
        }
    }

    /// Generate verb inflection dynamically based on the requested tense, mood, number, person, and root
    func inflection(
        for tense: GrammaticalTense,
        mood: GrammaticalMood,
        number: GrammaticalNumber,
        person: GrammaticalPerson,
        word: String
    ) -> String {
        switch self {
        case .strongClass1, .strongClass2, .strongClass3, .strongClass4, .strongClass5, .strongClass6, .strongClass7:
            return strongInflection(for: tense, mood: mood, number: number, person: person, word: word)
        case .weakClass1, .weakClass2, .weakClass3, .weakClass4:
            return weakInflection(for: tense, mood: mood, number: number, person: person, word: word)
        case .preteritePresent:
            return preteritePresentInflection(for: tense, mood: mood, number: number, person: person, word: word)
        case .irregular:
            return irregularInflection(for: tense, mood: mood, number: number, person: person, word: word)
        default:
            return "-"
        }
    }
    
    /// Handle irregular verb inflection using the data-driven approach
    private func irregularInflection(
        for tense: GrammaticalTense,
        mood: GrammaticalMood,
        number: GrammaticalNumber,
        person: GrammaticalPerson,
        word: String
    ) -> String {
        guard let irregularVerb = IrregularVerbStore.shared.getVerb(baseForm: word) else {
            return "-"
        }
        return irregularVerb.inflections[tense]?[mood]?[number]?[person] ?? "-"
    }
    
    func preteritePresentInflection (
        for tense: GrammaticalTense,
        mood: GrammaticalMood,
        number: GrammaticalNumber,
        person: GrammaticalPerson,
        word: String
    ) -> String {
        var suffix = preteritePresentSuffix(for: tense, mood: mood, number: number, person: person)
        
        if suffix == "-" {
            return "-"
        }
        
        var aiPattern = false
        
        var stem = extractBaseForm(from: word)
        for (_, char) in stem.enumerated() {
            if char == "u" {
                if tense == .present && mood == .indicative && number == .singular {
                    stem = stem.replacingOccurrences(of: "u", with: "a")
                }
                break
            }
            
            if char == "i" {
                if tense == .present && mood == .indicative && number == .singular {
                    stem = stem.replacingOccurrences(of: "i", with: "ai")
                }
                aiPattern = true
                break
            }
        }
        
        if aiPattern {
            if tense == .past || (tense == .present && mood == .indicative && number == .singular) {
                if tense == .present && (person != .second && stem.first == "w") {
                    print(stem)
                } else {
                    stem = stem.dropLast() + "s"
                }
            }
            
            if tense == .past {
                if stem.first == "l" {
                    suffix = "t" + suffix.dropFirst()
                } else if stem.first == "w" {
                    suffix = "s" + suffix.dropFirst()
                }
            }
        } else if stem.first == "þ" {
            if tense == .past || (tense == .present && number == .singular && mood == .indicative) {
                stem = stem.dropLast() + "f"
            }
            
            if tense == .past {
                suffix = "t" + suffix.dropFirst()
            }
        } else {
            if stem.last == "g" && suffix != "" && (tense == .past || (tense == .present && mood == .indicative && number == .singular && person == .second) ) {
                stem = stem.dropLast() + "h"
            }
            
            if stem.last == "h" && suffix.first == "d" {
                suffix = "t" + suffix.dropFirst()
            }
        }
        
        return stem + suffix
    }

    func weakInflection(
        for tense: GrammaticalTense,
        mood: GrammaticalMood,
        number: GrammaticalNumber,
        person: GrammaticalPerson,
        word: String
    ) -> String {
        let suffix = weakSuffix(for: tense, mood: mood, number: number, person: person)

        if suffix == "-" {
            return "-"
        }

        return extractBaseForm(from: word) + suffix
    }
    
    func strongInflection(
        for tense: GrammaticalTense,
        mood: GrammaticalMood,
        number: GrammaticalNumber,
        person: GrammaticalPerson,
        word: String
    ) -> String {
        // Select the appropriate stem based on tense
        let stem: String
        switch (tense, mood) {
        case (.present, _):
            stem = extractBaseForm(from: generatePresentStem(from: word))
        case (.past, _) where number == .singular && mood == .indicative:
            stem = extractBaseForm(from: generatePreteriteSingularStem(from: word))
        case (.past, _):
            stem = extractBaseForm(from: generatePreteritePluralStem(from: word))
        }
        
        let suffix = strongSuffix(for: tense, mood: mood, number: number, person: person)
        
        if suffix == "-" {
            return "-"
        }
        
        if self == .strongClass7 && mood == .indicative && number == .singular && person == .second && tense == .past {
            return stem.dropLast() + suffix
        }
        
        return stem + suffix
    }

    /// Generate the present stem dynamically
    private func generatePresentStem(from root: String) -> String {
        return root // No transformation needed for present stem in most cases
    }

    /// Generate the preterite singular stem dynamically
    private func generatePreteriteSingularStem(from root: String) -> String {
        switch self {
        case .strongClass1:
            return root.replacingOccurrences(of: "ī", with: "ai")
        case .strongClass2:
            return root.replacingOccurrences(of: "eu", with: "au")
        case .strongClass3:
            for (_, char) in root.enumerated() {
                if char == "i" {
                    return root.replacingOccurrences(of: "i", with: "a")
                }
            
                if char == "e" {
                    return root.replacingOccurrences(of: "e", with: "a")
                }
            }
        case .strongClass4:
            return root.replacingOccurrences(of: "e", with: "a")
        case .strongClass5:
            return root.replacingOccurrences(of: "e", with: "a")
        case .strongClass6:
            return root.replacingOccurrences(of: "a", with: "ō")
        case .strongClass7:
            return String(root.first!) + "e" + root
        default:
            return root // For weak verbs or irregular cases, return unchanged
        }
        
        return root
    }
    
    /// Generate the preterite plural stem dynamically
     private func generatePreteritePluralStem(from root: String) -> String {
         switch self {
         case .strongClass1:
             return root.replacingOccurrences(of: "ī", with: "i")
         case .strongClass2:
             return root.replacingOccurrences(of: "eu", with: "u")
         case .strongClass3:
             for (_, char) in root.enumerated() {
                 if char == "i" {
                     return root.replacingOccurrences(of: "i", with: "u")
                 }
                 
                 if char == "e" {
                     return root.replacingOccurrences(of: "e", with: "u")
                 }
             }
         case .strongClass4:
             return root.replacingOccurrences(of: "e", with: "ē")
         case .strongClass5:
             return root.replacingOccurrences(of: "e", with: "ē")
         case .strongClass6:
             return root.replacingOccurrences(of: "a", with: "ō")
         case .strongClass7:
             return String(root.first!) + "e" + root
         default:
             return root // For weak verbs or irregular cases, return unchanged
         }
         
         return root
     }
    
    private func preteritePresentSuffix(for tense: GrammaticalTense, mood: GrammaticalMood, number: GrammaticalNumber, person: GrammaticalPerson) -> String {
        
        switch (tense, mood, number, person) {
        
        // Present Indicative
        case (.present, .indicative, .singular, .first): return ""
        case (.present, .indicative, .singular, .second): return "t"
        case (.present, .indicative, .singular, .third): return ""
        case (.present, .indicative, .dual, .first): return "ū"
        case (.present, .indicative, .dual, .second): return "udiz"
        case (.present, .indicative, .plural, .first): return "um"
        case (.present, .indicative, .plural, .second): return "ud"
        case (.present, .indicative, .plural, .third): return "un"
        
        // Present Subjunctive
        case (.present, .subjunctive, .singular, .first): return "į̄"
        case (.present, .subjunctive, .singular, .second): return "īz"
        case (.present, .subjunctive, .singular, .third): return "ī"
        case (.present, .subjunctive, .dual, .first): return "īw"
        case (.present, .subjunctive, .dual, .second): return "īdiz"
        case (.present, .subjunctive, .plural, .first): return "īm"
        case (.present, .subjunctive, .plural, .second): return "īd"
        case (.present, .subjunctive, .plural, .third): return "īn"
        
        // Past Indicative
        case (.past, .indicative, .singular, .first): return "dǭ"
        case (.past, .indicative, .singular, .second): return "dēz"
        case (.past, .indicative, .singular, .third): return "dē"
        case (.past, .indicative, .dual, .first): return "dēdū"
        case (.past, .indicative, .dual, .second): return "dēdudiz"
        case (.past, .indicative, .plural, .first): return "dēdum"
        case (.past, .indicative, .plural, .second): return "dēdud"
        case (.past, .indicative, .plural, .third): return "dēdun"
            
        // Past Subjunctive
        case (.past, .subjunctive, .singular, .first): return "dēdį̄"
        case (.past, .subjunctive, .singular, .second): return "dēdīz"
        case (.past, .subjunctive, .singular, .third): return "dēdī"
        case (.past, .subjunctive, .dual, .first): return "dēdīw"
        case (.past, .subjunctive, .dual, .second): return "dēdīdiz"
        case (.past, .subjunctive, .plural, .first): return "dēdīm"
        case (.past, .subjunctive, .plural, .second): return "dēdīd"
        case (.past, .subjunctive, .plural, .third): return "dēdīn"
        
            
        default:
            return "-"
        }
        
    }
    
    /// Return suffixes for the verb form
    private func weakSuffix(for tense: GrammaticalTense, mood: GrammaticalMood, number: GrammaticalNumber, person: GrammaticalPerson) -> String {
        switch (tense, mood, number, person) {
        
        // Present Indicative
        case (.present, .indicative, .singular, .first): 
            switch self {
            case .weakClass1:
                return "jō"
            case .weakClass2, .weakClass3, .weakClass4:
                return "ō"
            default:
                return "ō"
            }
        case (.present, .indicative, .singular, .second):
            switch self {
            case .weakClass1:
                return "si"
            case .weakClass2, .weakClass4:
                return "ōsi"
            case .weakClass3:
                return "aisi"
            default:
                return "si"
            }
        case (.present, .indicative, .singular, .third):
            switch self {
            case .weakClass1:
                return "þi"
            case .weakClass2, .weakClass4:
                return "ōþi"
            case .weakClass3:
                return "aiþi"
            default:
                return "þi"
            }
        case (.present, .indicative, .dual, .first): 
            switch self {
            case .weakClass1:
                return "jōs"
            case .weakClass2, .weakClass3, .weakClass4:
                return "ōs"
            default:
                return "ōs"
            }
        case (.present, .indicative, .dual, .second): 
            switch self {
            case .weakClass1:
                return "jaþiz"
            case .weakClass2:
                return "ōþiz"
            case .weakClass3, .weakClass4:
                return "āþiz"
            default:
                return "þiz"
            }
        case (.present, .indicative, .plural, .first): 
            switch self {
            case .weakClass1:
                return "jamaz"
            case .weakClass2:
                return "ōmaz"
            case .weakClass3, .weakClass4:
                return "āmaz"
            default:
                return "maz"
            }
        case (.present, .indicative, .plural, .second):
            switch self {
            case .weakClass1:
                return "þ"
            case .weakClass2:
                return "ōþ"
            case .weakClass3:
                return "aiþ"
            case .weakClass4:
                return "āþ"
            default:
                return "þ"
            }
        case (.present, .indicative, .plural, .third):
            switch self {
            case .weakClass1:
                return "ijanþi"
            case .weakClass2:
                return "ōnþi"
            case .weakClass3:
                return "ānþi"
            case .weakClass4:
                return "anþi"
            default:
                return "anþi"
            }
        
        // Present Subjunctive
        case (.present, .subjunctive, .singular, .first):
            switch self {
            case .weakClass1:
                return "jaų"
            case .weakClass2:
                return "ǭ"
            case .weakClass3, .weakClass4:
                return "aų"
            default:
                return "aų"
            }
        case (.present, .subjunctive, .singular, .second): 
            switch self {
            case .weakClass1:
                return "jais"
            case .weakClass2:
                return "ōs"
            case .weakClass3:
                return "is"
            case .weakClass4:
                return "ais"
            default:
                return "is"
            }
        case (.present, .subjunctive, .singular, .third):
            switch self {
            case .weakClass1:
                return "jai"
            case .weakClass2:
                return "ō"
            case .weakClass3, .weakClass4:
                return "ai"
            default:
                return "ai"
            }
        case (.present, .subjunctive, .dual, .first): 
            switch self {
            case .weakClass1:
                return "jaiw"
            case .weakClass2:
                return "ōw"
            case .weakClass3, .weakClass4:
                return "aiw"
            default:
                return "aiw"
            }
        case (.present, .subjunctive, .dual, .second): 
            switch self {
            case .weakClass1:
                return "jaiþiz"
            case .weakClass2:
                return "ōþiz"
            case .weakClass3:
                return "aþiz"
            case .weakClass4:
                return "aiþiz"
            default:
                return "aþiz"
            }
        case (.present, .subjunctive, .plural, .first):
            switch self {
            case .weakClass1:
                return "jaim"
            case .weakClass2:
                return "ōm"
            case .weakClass3, .weakClass4:
                return "aim"
            default:
                return "aim"
            }
        case (.present, .subjunctive, .plural, .second): 
            switch self {
            case .weakClass1:
                return "jaiþ"
            case .weakClass2:
                return "ōþ"
            case .weakClass3, .weakClass4:
                return "aiþ"
            default:
                return "aiþ"
            }
        case (.present, .subjunctive, .plural, .third): 
            switch self {
            case .weakClass1:
                return "jain"
            case .weakClass2:
                return "ōn"
            case .weakClass3, .weakClass4:
                return "ain"
            default:
                return "ain"
            }
            
        // Present Inperative
        case (.present, .imperative, .singular, .second): 
            switch self {
            case .weakClass1:
                return ""
            case .weakClass2, .weakClass4:
                return "ō"
            case .weakClass3:
                return "ai"
            default:
                return ""
            }
        case (.present, .imperative, .singular, .third):
            switch self {
            case .weakClass1:
                return "jaþau"
            case .weakClass2, .weakClass4:
                return "ōþau"
            case .weakClass3:
                return "āþau"
            default:
                return "þau"
            }
        case (.present, .imperative, .dual, .second):
            switch self {
            case .weakClass1:
                return "jaþiz"
            case .weakClass2:
                return "ōþiz"
            case .weakClass3, .weakClass4:
                return "āþiz"
            default:
                return "þiz"
            }
        case (.present, .imperative, .plural, .second):
            switch self {
            case .weakClass1:
                return "īþ"
            case .weakClass2:
                return "ōþ"
            case .weakClass3:
                return "aiþ"
            case .weakClass4:
                return "aþ"
            default:
                return "īþ"
            }
        case (.present, .imperative, .plural, .third):
            switch self {
            case .weakClass1:
                return "janþau"
            case .weakClass2:
                return "ōnþau"
            case .weakClass3:
                return "ānþau"
            case .weakClass4:
                return "anþau"
            default:
                return "nþau"
            }
        
        // Past Indicative
        case (.past, .indicative, .singular, .first): 
            switch self {
            case .weakClass1:
                return "dǭ"
            case .weakClass2, .weakClass4:
                return "ōdǭ"
            case .weakClass3:
                return "adǭ"
            default:
                return "dǭ"
            }
        case (.past, .indicative, .singular, .second):
            switch self {
            case .weakClass1:
                return "dēz"
            case .weakClass2, .weakClass4:
                return "ōdēz"
            case .weakClass3:
                return "adēz"
            default:
                return "dēz"
            }
        case (.past, .indicative, .singular, .third):
            switch self {
            case .weakClass1:
                return "dē"
            case .weakClass2, .weakClass4:
                return "ōdē"
            case .weakClass3:
                return "adē"
            default:
                return "dē"
            }
        case (.past, .indicative, .dual, .first):
            switch self {
            case .weakClass1:
                return "dēdū"
            case .weakClass2, .weakClass4:
                return "ōdēdū"
            case .weakClass3:
                return "adēdū"
            default:
                return "dēdū"
            }
        case (.past, .indicative, .dual, .second):
            switch self {
            case .weakClass1:
                return "dēdudiz"
            case .weakClass2, .weakClass4:
                return "ōdēdudiz"
            case .weakClass3:
                return "adēdudiz"
            default:
                return "dēdudiz"
            }
        case (.past, .indicative, .plural, .first):
            switch self {
            case .weakClass1:
                return "dēdum"
            case .weakClass2, .weakClass4:
                return "ōdēdum"
            case .weakClass3:
                return "adēdum"
            default:
                return "dēdum"
            }
        case (.past, .indicative, .plural, .second):
            switch self {
            case .weakClass1:
                return "dēdud"
            case .weakClass2, .weakClass4:
                return "ōdēdud"
            case .weakClass3:
                return "adēdud"
            default:
                return "dēdud"
            }
        case (.past, .indicative, .plural, .third):
            switch self {
            case .weakClass1:
                return "dēdun"
            case .weakClass2, .weakClass4:
                return "ōdēdun"
            case .weakClass3:
                return "adēdun"
            default:
                return "dēdun"
            }
            
        // Past Subjunctive
        case (.past, .subjunctive, .singular, .first):
            switch self {
            case .weakClass1:
                return "dēdį̄"
            case .weakClass2, .weakClass4:
                return "ōdēdį̄"
            case .weakClass3:
                return "adēdį̄"
            default:
                return "dēdį̄"
            }
        case (.past, .subjunctive, .singular, .second): 
            switch self {
            case .weakClass1:
                return "dēdīz"
            case .weakClass2, .weakClass4:
                return "ōdēdīz"
            case .weakClass3:
                return "adēdīz"
            default:
                return "dēdīz"
            }
        case (.past, .subjunctive, .singular, .third):
            switch self {
            case .weakClass1:
                return "dēdī"
            case .weakClass2, .weakClass4:
                return "ōdēdī"
            case .weakClass3:
                return "adēdī"
            default:
                return "dēdī"
            }
        case (.past, .subjunctive, .dual, .first):
            switch self {
            case .weakClass1:
                return "dēdīw"
            case .weakClass2, .weakClass4:
                return "ōdēdīw"
            case .weakClass3:
                return "adēdīw"
            default:
                return "dēdīw"
            }
        case (.past, .subjunctive, .dual, .second):
            switch self {
            case .weakClass1:
                return "dēdīdiz"
            case .weakClass2, .weakClass4:
                return "ōdēdīdiz"
            case .weakClass3:
                return "adēdīdiz"
            default:
                return "dēdīdiz"
            }
        case (.past, .subjunctive, .plural, .first):
            switch self {
            case .weakClass1:
                return "dēdīm"
            case .weakClass2, .weakClass4:
                return "ōdēdīm"
            case .weakClass3:
                return "adēdīm"
            default:
                return "dēdīm"
            }
        case (.past, .subjunctive, .plural, .second):
            switch self {
            case .weakClass1:
                return "dēdīd"
            case .weakClass2, .weakClass4:
                return "ōdēdīd"
            case .weakClass3:
                return "adēdīd"
            default:
                return "dēdīd"
            }
        case (.past, .subjunctive, .plural, .third):
            switch self {
            case .weakClass1:
                return "dēdīn"
            case .weakClass2, .weakClass4:
                return "ōdēdīn"
            case .weakClass3:
                return "adēdīn"
            default:
                return "dēdīn"
            }
        default:
            return "-"
        }
    }
    
    /// Return suffixes for the verb form
    private func strongSuffix(for tense: GrammaticalTense, mood: GrammaticalMood, number: GrammaticalNumber, person: GrammaticalPerson) -> String {
        switch (tense, mood, number, person) {
        
        // Present Indicative
        case (.present, .indicative, .singular, .first): return "ō"
        case (.present, .indicative, .singular, .second): return "izi"
        case (.present, .indicative, .singular, .third): return "idi"
        case (.present, .indicative, .dual, .first): return "ōz"
        case (.present, .indicative, .dual, .second): return "adiz"
        case (.present, .indicative, .plural, .first): return "amaz"
        case (.present, .indicative, .plural, .second): return "id"
        case (.present, .indicative, .plural, .third): return "andi"
        
        // Present Subjunctive
        case (.present, .subjunctive, .singular, .first): return "aų"
        case (.present, .subjunctive, .singular, .second): return "aiz"
        case (.present, .subjunctive, .singular, .third): return "ai"
        case (.present, .subjunctive, .dual, .first): return "aiw"
        case (.present, .subjunctive, .dual, .second): return "aidiz"
        case (.present, .subjunctive, .plural, .first): return "aim"
        case (.present, .subjunctive, .plural, .second): return "aid"
        case (.present, .subjunctive, .plural, .third): return "ain"
            
        // Present Inperative
        case (.present, .imperative, .singular, .second): return ""
        case (.present, .imperative, .singular, .third): return "adau"
        case (.present, .imperative, .dual, .second): return "adiz"
        case (.present, .imperative, .plural, .second): return "id"
        case (.present, .imperative, .plural, .third): return "andau"
        
        // Past Indicative (Singular uses preterite singular stem)
        case (.past, .indicative, .singular, .first): return ""
        case (.past, .indicative, .singular, .second): return "st"
        case (.past, .indicative, .singular, .third): return ""
        
        // Past Indicative (Plural uses preterite plural stem)
        case (.past, .indicative, .dual, .first): return "ū"
        case (.past, .indicative, .dual, .second): return "udiz"
        case (.past, .indicative, .plural, .first): return "um"
        case (.past, .indicative, .plural, .second): return "ud"
        case (.past, .indicative, .plural, .third): return "un"
            
        // Past Subjunctive
        case (.past, .subjunctive, .singular, .first): return "į̄"
        case (.past, .subjunctive, .singular, .second): return "īz"
        case (.past, .subjunctive, .singular, .third): return "ī"
        case (.past, .subjunctive, .dual, .first): return "īw"
        case (.past, .subjunctive, .dual, .second): return "īdiz"
        case (.past, .subjunctive, .plural, .first): return "īm"
        case (.past, .subjunctive, .plural, .second): return "īd"
        case (.past, .subjunctive, .plural, .third): return "īn"
        
            
        default:
            return "-"
        }
    }
    
    // Function to detect stem type based on nominative ending and gender
    static func detectVerbClass(isStrong: Bool, verbClass: String) -> VerbClass {
        switch (isStrong, verbClass) {
        case (true, "1"):
            return .strongClass1
        case (true, "2"):
            return .strongClass2
        case (true, "3"):
            return .strongClass3
        case (true, "4"):
            return .strongClass4
        case (true, "5"):
            return .strongClass5
        case (true, "6"):
            return .strongClass6
        case (true, "7"), (true, "7a"), (true, "7b"), (true, "7c"), (true, "7d"), (true, "7e"):
            return .strongClass7
        case (false, "wk1"):
            return .weakClass1
        case (false, "wk2"):
            return .weakClass2
        case (false, "wk3"):
            return .weakClass3
        case (false, "wk4"):
            return .weakClass4
        case (false, "Preterite-Present"):
            return .preteritePresent
        case (false, "Irregular"):
            return .irregular
        default:
            return .unknown
        }
    }
}
