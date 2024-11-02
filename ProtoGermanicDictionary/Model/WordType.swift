//
//  WordType.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 02/11/2024.
//

import Foundation

enum WordType: String, CaseIterable {
    case noun = "Noun"
    case verb = "Verb"
    case adjective = "Adjective"
    case adverb = "Adverb"
    case pronoun = "Pronoun"
    case preposition = "Preposition"
    case conjunction = "Conjunction"
    case interjection = "Interjection"
    case determiner = "Determiner"
    case numeral = "Numeral"
    case particle = "Particle"
    case prefix = "Prefix"
    case suffix = "Suffix"
    case root = "Root"
    case properNoun = "Proper noun"
    case unknown = "Unknown"
}
