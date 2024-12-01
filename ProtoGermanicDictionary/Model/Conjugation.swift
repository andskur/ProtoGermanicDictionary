//
//  File.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 01/12/2024.
//

import Foundation

enum Conjugation: String, CaseIterable, Hashable {
    case firstSingular = "1st singular"
    case secondSingular = "2nd singular"
    case thirdSingular = "3rd singular"
    case firstDual = "1st dual"
    case secondDual = "2nd dual"
    case firstPlural = "1st plural"
    case secondPlural = "2nd plural"
    case thirdPlural = "3rd plural"

    /// Maps `Conjugation` cases to grammatical number and person
    var components: (GrammaticalNumber, GrammaticalPerson) {
        switch self {
        case .firstSingular: return (.singular, .first)
        case .secondSingular: return (.singular, .second)
        case .thirdSingular: return (.singular, .third)
        case .firstDual: return (.dual, .first)
        case .secondDual: return (.dual, .second)
        case .firstPlural: return (.plural, .first)
        case .secondPlural: return (.plural, .second)
        case .thirdPlural: return (.plural, .third)
        }
    }
}
