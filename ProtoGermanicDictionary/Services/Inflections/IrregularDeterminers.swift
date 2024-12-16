//
//  IrregularDeterminers.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 16/12/2024.
//

import Foundation


struct IrregularDeterminers {
    static let storage: [String: [AdjectiveDeclension: [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]]]] = [
        "bai": [
            .strong: [
                .plural: [
                    .nominative: [.masculine: "bai", .feminine: "bōz", .neuter: "bō"],
                    .accusative: [.masculine: "banz", .feminine: "bōz", .neuter: "bō" ],
                    .genitive: [.masculine: "bajjǫ̂",.feminine: "bajjǫ̂",.neuter: "bajjǫ̂"],
                    .dative: [.masculine: "baimaz",.feminine: "baimaz",.neuter: "baimaz"],
                    .instrumental: [.masculine: "baimiz",.feminine: "baimiz",.neuter: "baimiz"]
                ]
            ]
        ],
        "sa": [
            .strong: [
                .singular: [
                    .nominative: [.masculine: "sa", .feminine: "sō", .neuter: "þat"],
                    .accusative: [.masculine: "þanǭ", .feminine: "þǭ", .neuter: "þat" ],
                    .genitive: [.masculine: "þas",.feminine: "þaizōz",.neuter: "þas"],
                    .dative: [.masculine: "þammai",.feminine: "þaizōi",.neuter: "þammai"],
                    .instrumental: [.masculine: "þanō",.feminine: "þaizō",.neuter: "þanō"]
                ],
                .plural: [
                    .nominative: [.masculine: "þai", .feminine: "þôz", .neuter: "þō"],
                    .accusative: [.masculine: "þanz", .feminine: "þōz", .neuter: "þō" ],
                    .genitive: [.masculine: "þaizǫ̂",.feminine: "þaizǫ̂",.neuter: "þaizǫ̂"],
                    .dative: [.masculine: "þaimaz",.feminine: "þaimaz",.neuter: "þaimaz"],
                    .instrumental: [.masculine: "þaimiz",.feminine: "þaimiz",.neuter: "þaimiz"]
                ]
            ]
        ],
        "hiz": [
            .strong: [
                .singular: [
                    .nominative: [.masculine: "hiz", .feminine: "hijō", .neuter: "hit"],
                    .accusative: [.masculine: "hinǭ", .feminine: "hijǭ", .neuter: "hit" ],
                    .genitive: [.masculine: "hes",.feminine: "hezōz",.neuter: "hes"],
                    .dative: [.masculine: "himmai",.feminine: "hezōi",.neuter: "himmai"],
                    .instrumental: [.masculine: "hinō",.feminine: "hezō",.neuter: "hinō"]
                ],
                .plural: [
                    .nominative: [.masculine: "hīz", .feminine: "hijōz", .neuter: "hijō"],
                    .accusative: [.masculine: "hinz", .feminine: "hijōz", .neuter: "hijō" ],
                    .genitive: [.masculine: "hezǫ̂",.feminine: "hezǫ̂",.neuter: "hezǫ̂"],
                    .dative: [.masculine: "himaz",.feminine: "himaz",.neuter: "himaz"],
                    .instrumental: [.masculine: "himiz",.feminine: "himiz",.neuter: "himiz"]
                ]
            ]
        ]
    ]
    
}
