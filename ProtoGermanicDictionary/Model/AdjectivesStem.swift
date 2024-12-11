//
//  AdjectivesStem.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 08/12/2024.
//

import Foundation

enum AdjectivesStem: String {
    case aStem      = "a-stem"
    case iStem      = "i-stem"
    case uStem      = "u-stem"
    case nStem      = "n-stem"
    case inStem     = "in-stem"
    case unknown    = "unknown"
    
    // Function to detect stem type based on nominative ending and gender
    static func detectStemType(word: String) -> AdjectivesStem {
        if word == "alþizô" || word == "flaizô" || word == "tehswô"{
            return.nStem
        }
        
        let ending = word.lowercased()
        
        switch ending {
        case let (ending) where (ending.hasSuffix("az") || ending.hasSuffix("jaz")):
            return .aStem
        case let (ending) where ending.hasSuffix("iz"):
            return .iStem
        case let (ending) where ending.hasSuffix("uz"):
            return .uStem
        case let (ending) where ending.hasSuffix("ô"):
            return .inStem
        default:
            return .unknown
        }
    }
}
