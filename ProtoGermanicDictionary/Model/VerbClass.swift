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
