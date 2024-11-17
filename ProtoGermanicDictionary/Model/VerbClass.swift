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

        
        let suffix = suffix(for: tense, mood: mood, number: number, person: person)
        
        // Add suffix based on tense, mood, number, and person
        if suffix == "-" {
            return "-"
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
            return root.replacingOccurrences(of: "e", with: "a")
        case .strongClass4:
            return root.replacingOccurrences(of: "ē", with: "a")
        case .strongClass5:
            return root.replacingOccurrences(of: "e", with: "a")
        case .strongClass6:
            return root.replacingOccurrences(of: "a", with: "ō")
        case .strongClass7:
            return root + "ē"
        default:
            return root // For weak verbs or irregular cases, return unchanged
        }
    }
    
    /// Generate the preterite plural stem dynamically
     private func generatePreteritePluralStem(from root: String) -> String {
         switch self {
         case .strongClass1:
             return root.replacingOccurrences(of: "ī", with: "i")
         case .strongClass2:
             return root.replacingOccurrences(of: "eu", with: "u")
         case .strongClass3:
             return root.replacingOccurrences(of: "e", with: "u")
         case .strongClass4:
             return root.replacingOccurrences(of: "ē", with: "ē")
         case .strongClass5:
             return root.replacingOccurrences(of: "e", with: "ē")
         case .strongClass6:
             return root.replacingOccurrences(of: "a", with: "a")
         case .strongClass7:
             return root + "ē"
         default:
             return root // For weak verbs or irregular cases, return unchanged
         }
     }
    
    /// Return suffixes for the verb form
    private func suffix(for tense: GrammaticalTense, mood: GrammaticalMood, number: GrammaticalNumber, person: GrammaticalPerson) -> String {
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
