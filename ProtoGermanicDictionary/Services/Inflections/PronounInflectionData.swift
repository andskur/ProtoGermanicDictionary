//
//  PronounInflectionData.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 06/12/2024.
//

//
//  PronounInflectionData.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 06/12/2024.
//

import Foundation

struct PronounInflectionData {
    static let personalPronouns: [GrammaticalNumber: [GrammaticalCase: [GrammaticalPerson: String]]] = [
        .singular: [
            .nominative: [.first: "ek", .second: "þū", .reflexive: "se"],
            .accusative: [.first: "mek", .second: "þek", .reflexive: "sek"],
            .dative: [.first: "miz", .second: "þiz", .reflexive: "siz"],
            .instrumental: [.first: "miz", .second: "þiz", .reflexive: "siz"],
            .possessive: [.first: "mīnaz", .second: "þīnaz", .reflexive: "sīnaz"]
        ],
        .dual: [
            .nominative: [.first: "wet", .second: "jut", .reflexive: "se"],
            .accusative: [.first: "unk", .second: "inkw", .reflexive: "sek"],
            .dative: [.first: "unkiz", .second: "inkwiz", .reflexive: "siz"],
            .instrumental: [.first: "unkiz", .second: "inkwiz", .reflexive: "siz"],
            .possessive: [.first: "unkeraz", .second: "inkweraz", .reflexive: "sīnaz"]
        ],
        .plural: [
            .nominative: [.first: "wīz", .second: "jūz", .reflexive: "se"],
            .accusative: [.first: "uns", .second: "izwiz", .reflexive: "sek"],
            .dative: [.first: "unsiz", .second: "izwiz", .reflexive: "siz"],
            .instrumental: [.first: "unsiz", .second: "izwiz", .reflexive: "siz"],
            .possessive: [.first: "unseraz", .second: "izweraz", .reflexive: "sīnaz"]
        ]
    ]

    static let genderedPronouns: [String: [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]]] = [
        "hwazuh": [
            .singular: [
                .nominative: [.masculine: "hwazuh", .feminine: "hwōhw", .neuter: "hwatuh"],
                .accusative: [.masculine: "hwanǭhw", .feminine: "hwōhw", .neuter: "hwatuh" ],
                .genitive: [.masculine: "hwesuh",.feminine: "hwezōzuh",.neuter: "hwesuh"],
                .dative: [.masculine: "hwammaihw",.feminine: "hwezōihw",.neuter: "hwammaihw"],
                .instrumental: [.masculine: "hwēhw",.feminine: "hwezōhw",.neuter: "hwōhw"]
            ]
        ],
        "hwaz": [
            .singular: [
                .nominative: [.masculine: "hwaz",.feminine: "hwō",.neuter: "hwat"],
                .accusative: [.masculine: "hwanǭ",.feminine: "hwǭ",.neuter: "hwat"],
                .genitive: [.masculine: "hwes",.feminine: "hwezōz",.neuter: "hwes"],
                .dative: [.masculine: "hwammai",.feminine: "hwezōi",.neuter: "hwammai"],
                .instrumental: [.masculine: "hwē",.feminine: "hwezō",.neuter: "hwō"]
            ]
        ],
        "sahw": [
            .singular: [
                .nominative: [.masculine: "sahw",.feminine: "sōhw",.neuter: "þatuh"],
                .accusative: [.masculine: "þanǭhw",.feminine: "þǭhw",.neuter: "þatuh"],
                .genitive: [.masculine: "þasuh",.feminine: "þaizōzuh",.neuter: "þasuh"],
                .dative: [.masculine: "þammaihw",.feminine: "þaizōihw",.neuter: "þammaihw"],
                .instrumental: [.masculine: "þanōhw",.feminine: "þaizōhw",.neuter: "þanōhw"]
            ],
            .plural: [
                .nominative: [.masculine: "þaihw",.feminine: "þôzuh",.neuter: "þōhw"],
                .accusative: [.masculine: "þanzuh",.feminine: "þōzuh",.neuter: "þōhw"],
                .genitive: [.masculine: "þaizǫ̂hw",.feminine: "þaizǫ̂hw",.neuter: "þaizǫ̂hw"],
                .dative: [.masculine: "þaimazuh",.feminine: "þaimazuh",.neuter: "þaimazuh"],
                .instrumental: [.masculine: "þaimizuh",.feminine: "þaimizuh",.neuter: "þaimizuh"]
            ]
        ],
        "saī": [
            .singular: [
                .nominative: [.masculine: "saī",.feminine: "sōī",.neuter: "þatī"],
                .accusative: [.masculine: "þanǭī",.feminine: "þǭī",.neuter: "þatī"],
                .genitive: [.masculine: "þasī",.feminine: "þaizōzī",.neuter: "þasī"],
                .dative: [.masculine: "þammaiī",.feminine: "þaizōiī",.neuter: "þammaiī"],
                .instrumental: [.masculine: "þanōī",.feminine: "þaizōī",.neuter: "þanōī"]
            ],
            .plural: [
                .nominative: [.masculine: "þaiī",.feminine: "þôzī",.neuter: "þōī"],
                .accusative: [.masculine: "þanzuh",.feminine: "þôzī",.neuter: "þōī"],
                .genitive: [.masculine: "þaizǫ̂ī",.feminine: "þaizǫ̂ī",.neuter: "þaizǫ̂ī"],
                .dative: [.masculine: "þaimazī",.feminine: "þaimazī",.neuter: "þaimazī"],
                .instrumental: [.masculine: "þaimizī",.feminine: "þaimizī",.neuter: "þaimizī"]
            ]
        ],
        "selbaz": [
            .singular: [
                .nominative: [.masculine: "selbaz",.feminine: "selbō",.neuter: "selbą"],
                .accusative: [.masculine: "selbanǭ",.feminine: "selbǭ",.neuter: "selbą"],
                .genitive: [.masculine: "selbas",.feminine: "selbaizōz",.neuter: "selbas"],
                .dative: [.masculine: "selbammai",.feminine: "selbaizōi",.neuter: "selbammai"],
                .instrumental: [.masculine: "selbanō",.feminine: "selbaizō",.neuter: "selbanō"]
            ],
            .plural: [
                .nominative: [.masculine: "selbai",.feminine: "selbôz",.neuter: "selbō"],
                .accusative: [.masculine: "selbanz",.feminine: "selbōz",.neuter: "selbō"],
                .genitive: [.masculine: "selbaizǫ̂",.feminine: "selbaizǫ̂",.neuter: "selbaizǫ̂"],
                .dative: [.masculine: "selbaimaz",.feminine: "selbaimaz",.neuter: "selbaimaz"],
                .instrumental: [.masculine: "selbaimiz",.feminine: "selbaimiz",.neuter: "selbaimiz"]
            ]
        ],
        "iz": [
            .singular: [
                .nominative: [.masculine: "iz",.feminine: "sī",.neuter: "it"],
                .accusative: [.masculine: "inǭ",.feminine: "ijǭ",.neuter: "it"],
                .genitive: [.masculine: "es",.feminine: "ezōz",.neuter: "es"],
                .dative: [.masculine: "immai",.feminine: "ezōi",.neuter: "immai"],
                .instrumental: [.masculine: "inō",.feminine: "ezō",.neuter: "inō"]
            ],
            .plural: [
                .nominative: [.masculine: "īz",.feminine: "ijôz",.neuter: "ijō"],
                .accusative: [.masculine: "inz",.feminine: "ijōz",.neuter: "ijō"],
                .genitive: [.masculine: "ezǫ̂",.feminine: "ezǫ̂",.neuter: "ezǫ̂"],
                .dative: [.masculine: "imaz",.feminine: "imaz",.neuter: "imaz"],
                .instrumental: [.masculine: "imiz",.feminine: "imiz",.neuter: "imiz"]
            ]
        ]
    ]
}

