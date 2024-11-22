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
    case irregular = "Irregular"
    case unknown = "Unknown"

    /// Extracts the base form of a verb, based on class-specific rules.
    private func extractBaseForm(from word: String) -> String {
        switch self {
        case .strongClass1, .strongClass2, .strongClass3, .strongClass4, .strongClass5, .strongClass6, .strongClass7:
            return String(word.dropLast(3))
        case .weakClass1:
            return String(word.dropLast(4))
        case .weakClass2:
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
        case .irregular:
            return "-"
        default:
            return "-"
        }
    }

    func weakInflection(
        for tense: GrammaticalTense,
        mood: GrammaticalMood,
        number: GrammaticalNumber,
        person: GrammaticalPerson,
        word: String
    ) -> String {
        let suffix = weakSuffix(for: tense, mood: mood, number: number, person: person)

        // Add suffix based on tense, mood, number, and person
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
        
        // Add suffix based on tense, mood, number, and person
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
    
    /// Return suffixes for the verb form
    private func weakSuffix(for tense: GrammaticalTense, mood: GrammaticalMood, number: GrammaticalNumber, person: GrammaticalPerson) -> String {
        switch (tense, mood, number, person) {
        
        // Present Indicative
        case (.present, .indicative, .singular, .first): 
            switch self {
            case .weakClass1:
                return "jō"
            case .weakClass2:
                return "ō"
            default:
                return "ō"
            }
        case (.present, .indicative, .singular, .second):
            switch self {
            case .weakClass1:
                return "si"
            case .weakClass2:
                return "ōsi"
            default:
                return "si"
            }
        case (.present, .indicative, .singular, .third):
            switch self {
            case .weakClass1:
                return "þi"
            case .weakClass2:
                return "ōþi"
            default:
                return "þi"
            }
        case (.present, .indicative, .dual, .first): 
            switch self {
            case .weakClass1:
                return "jōs"
            case .weakClass2:
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
            default:
                return "þiz"
            }
        case (.present, .indicative, .plural, .first): 
            switch self {
            case .weakClass1:
                return "jamaz"
            case    .weakClass2:
                return "ōmaz"
            default:
                return "maz"
            }
        case (.present, .indicative, .plural, .second):
            switch self {
            case .weakClass1:
                return "þ"
            case .weakClass2:
                return "ōþ"
            default:
                return "þ"
            }
        case (.present, .indicative, .plural, .third):
            switch self {
            case .weakClass1:
                return "ijanþi"
            case .weakClass2:
                return "ōnþi"
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
            default:
                return "aų"
            }
        case (.present, .subjunctive, .singular, .second): 
            switch self {
                case .weakClass1:
                return "jais"
            case .weakClass2:
                return "ōs"
            default:
                return "is"
            }
        case (.present, .subjunctive, .singular, .third):
            switch self {
            case .weakClass1:
                return "jai"
            case .weakClass2:
                return "ō"
            default:
                return "ai"
            }
        case (.present, .subjunctive, .dual, .first): 
            switch self {
            case .weakClass1:
                return "jaiw"
            case .weakClass2:
                return "ōw"
            default:
                return "aiw"
            }
        case (.present, .subjunctive, .dual, .second): 
            switch self {
            case .weakClass1:
                return "jaiþiz"
            case .weakClass2:
                return "ōþiz"
            default:
                return "þiz"
            }
        case (.present, .subjunctive, .plural, .first):
            switch self {
            case .weakClass1:
                return "jaim"
            case .weakClass2:
                return "ōm"
            default:
                return "aim"
            }
        case (.present, .subjunctive, .plural, .second): 
            switch self {
            case .weakClass1:
                return "jaiþ"
            case .weakClass2:
                return "ōþ"
            default:
                return "aiþ"
            }
        case (.present, .subjunctive, .plural, .third): 
            switch self {
            case .weakClass1:
                return "jain"
            case .weakClass2:
                return "ōn"
            default:
                return "ain"
            }
            
        // Present Inperative
        case (.present, .imperative, .singular, .second): 
            switch self {
            case .weakClass1:
                return ""
            case .weakClass2:
                return "ō"
            default:
                return ""
            }
        case (.present, .imperative, .singular, .third):
            switch self {
            case .weakClass1:
                return "jaþau"
            case .weakClass2:
                return "ōþau"
            default:
                return "þau"
            }
        case (.present, .imperative, .dual, .second):
            switch self {
            case .weakClass1:
                return "jaþiz"
            case .weakClass2:
                return "ōþiz"
            default:
                return "þiz"
            }
        case (.present, .imperative, .plural, .second):
            switch self {
            case .weakClass1:
                return "īþ"
            case .weakClass2:
                return "ōþ"
            default:
                return "īþ"
            }
        case (.present, .imperative, .plural, .third):
            switch self {
            case .weakClass1:
                return "janþau"
            case .weakClass2:
                return "ōnþau"
            default:
                return "nþau"
            }
        
        // Past Indicative
        case (.past, .indicative, .singular, .first): 
            switch self {
            case .weakClass1:
                return "dǭ"
            case .weakClass2:
                return "ōdǭ"
            default:
                return "dǭ"
            }
        case (.past, .indicative, .singular, .second):
            switch self {
            case .weakClass1:
                return "dēz"
            case .weakClass2:
                return "ōdēz"
            default:
                return "dēz"
            }
        case (.past, .indicative, .singular, .third):
            switch self {
            case .weakClass1:
                return "dē"
            case .weakClass2:
                return "ōdē"
            default:
                return "dē"
            }
        case (.past, .indicative, .dual, .first):
            switch self {
            case .weakClass1:
                return "dēdū"
            case .weakClass2:
                return "ōdēdū"
            default:
                return "dēdū"
            }
        case (.past, .indicative, .dual, .second):
            switch self {
            case .weakClass1:
                return "dēdudiz"
            case .weakClass2:
                return "ōdēdudiz"
            default:
                return "dēdudiz"
            }
        case (.past, .indicative, .plural, .first):
            switch self {
            case .weakClass1:
                return "dēdum"
            case .weakClass2:
                return "ōdēdum"
            default:
                return "dēdum"
            }
        case (.past, .indicative, .plural, .second):
            switch self {
            case .weakClass1:
                return "dēdud"
            case .weakClass2:
                return "ōdēdud"
            default:
                return "dēdud"
            }
        case (.past, .indicative, .plural, .third):
            switch self {
            case .weakClass1:
                return "dēdun"
            case .weakClass2:
                return "ōdēdun"
            default:
                return "dēdun"
            }
            
        // Present Subjunctive
        case (.past, .subjunctive, .singular, .first): 
            switch self {
            case .weakClass1:
                return "dēdį̄"
            case .weakClass2:
                return "ōdēdį̄"
            default:
                return "dēdį̄"
            }
        case (.past, .subjunctive, .singular, .second): 
            switch self {
            case .weakClass1:
                return "dēdīz"
            case .weakClass2:
                return "ōdēdīz"
            default:
                return "dēdīz"
            }
        case (.past, .subjunctive, .singular, .third):
            switch self {
            case .weakClass1:
                return "dēdī"
            case .weakClass2:
                return "ōdēdī"
            default:
                return "dēdī"
            }
        case (.past, .subjunctive, .dual, .first):
            switch self {
            case .weakClass1:
                return "dēdīw"
            case .weakClass2:
                return "ōdēdīw"
            default:
                return "dēdīw"
            }
        case (.past, .subjunctive, .dual, .second):
            switch self {
            case .weakClass1:
                return "dēdīdiz"
            case .weakClass2:
                return "ōdēdīdiz"
            default:
                return "dēdīdiz"
            }
        case (.past, .subjunctive, .plural, .first):
            switch self {
            case .weakClass1:
                return "dēdīm"
            case .weakClass2:
                return "ōdēdīm"
            default:
                return "dēdīm"
            }
        case (.past, .subjunctive, .plural, .second):
            switch self {
            case .weakClass1:
                return "dēdīd"
            case .weakClass2:
                return "ōdēdīd"
            default:
                return "dēdīd"
            }
        case (.past, .subjunctive, .plural, .third):
            switch self {
            case .weakClass1:
                return "dēdīn"
            case .weakClass2:
                return "ōdēdīn"
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
            
        // Present Subjunctive
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
        default:
            return .unknown
        }
    }
}
