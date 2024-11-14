//
//  VerbInflectionTableView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 14/11/2024.
//

import SwiftUI

struct VerbInflectionTableView: View {
    var inflections: [GrammaticalTense: [GrammaticalMood: [GrammaticalNumber: [GrammaticalPerson: String]]]]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Verb Inflection Table")
                .font(.headline)
                .padding(.bottom, 5)

            // Loop through all tenses
            ForEach(GrammaticalTense.allCases, id: \.self) { tense in
                Text("\(tense.rawValue) Tense")
                    .font(.subheadline)
                    .padding(.top, 10)
                
                tenseHeaderRow()
                
                // Loop through grammatical numbers and display inflection rows for the current tense
                ForEach(GrammaticalNumber.allCases, id: \.self) { number in
                    verbInflectionRow(number: number, tense: tense)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemGray6).opacity(0.2))
        .cornerRadius(8)
        .padding()
    }
    
    private func tenseHeaderRow() -> some View {
        HStack {
            Text("") // Empty cell for alignment
                .frame(width: 100, alignment: .leading)
            
            // Loop through moods to create headers
            ForEach(GrammaticalMood.allCases, id: \.self) { mood in
                Text(mood.rawValue)
                    .frame(maxWidth: .infinity)
                    .font(.subheadline.weight(.medium))
            }
        }
        .background(Color(UIColor.systemGray5))
        .padding(.vertical, 4)
    }
    
    // Generate inflection rows for each grammatical person within the specified tense
    private func verbInflectionRow(number: GrammaticalNumber, tense: GrammaticalTense) -> some View {
        VStack(spacing: 0) {
            ForEach(GrammaticalPerson.allCases, id: \.self) { person in
                personInflectionRow(person: person, number: number, tense: tense)
            }
        }
    }
    
    private func personInflectionRow(person: GrammaticalPerson, number: GrammaticalNumber, tense: GrammaticalTense) -> some View {
        HStack {
            Text("\(person.rawValue) \(number.rawValue.lowercased())")
                .frame(width: 100, alignment: .leading)
                .padding(.vertical, 4)
                .background(Color(UIColor.systemGray5).opacity(0.3))
            
            // Loop through each mood to fill in the cells
            ForEach(GrammaticalMood.allCases, id: \.self) { mood in
                let form = inflections[tense]?[mood]?[number]?[person] ?? "-"
                Text(form)
                    .frame(maxWidth: .infinity)
            }
        }
        .background(Color(UIColor.systemGray6).opacity(0.1))
    }
}

struct VerbInflectionTableView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleInflections: [GrammaticalTense: [GrammaticalMood: [GrammaticalNumber: [GrammaticalPerson: String]]]] = [
            .present: [
                .indicative: [
                    .singular: [
                        .first: "*bīđō",
                        .second: "*bīđizi",
                        .third: "*bīđidi"
                    ],
                    .plural: [
                        .first: "*bīđamaz",
                        .second: "*bīđid",
                        .third: "*bīđandi"
                    ]
                ],
                .subjunctive: [
                    .singular: [
                        .first: "*bīđau",
                        .second: "*bīđaiz",
                        .third: "*bīđai"
                    ]
                ]
            ],
            .past: [
                .indicative: [
                    .singular: [
                        .first: "*baid",
                        .second: "*baist",
                        .third: "*baid"
                    ],
                    .plural: [
                        .first: "*bidum",
                        .second: "*bidud",
                        .third: "*bidun"
                    ]
                ]
            ]
        ]
        
        return VerbInflectionTableView(inflections: exampleInflections)
    }
}
