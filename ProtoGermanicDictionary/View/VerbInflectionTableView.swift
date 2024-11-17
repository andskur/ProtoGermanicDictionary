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
                    .fontWeight(.bold)
                
                tenseHeaderRow(for: tense)
                
                // Loop through grammatical numbers and display inflection rows for the current tense
                ForEach(GrammaticalNumber.allCases, id: \.self) { number in
                    verbInflectionRow(number: number, tense: tense)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemGray6).opacity(0.2))
        .cornerRadius(8)
    }
    
    private func tenseHeaderRow(for tense: GrammaticalTense) -> some View {
        HStack {
            Text("") // Empty cell for alignment
                .frame(width: 100, alignment: .leading)
            
            // Loop through moods to create headers
            ForEach(GrammaticalMood.allCases.filter { mood in
                !(mood == .imperative && tense == .past) // Exclude imperative for past tense only
            }, id: \.self) { mood in
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
            ForEach(GrammaticalPerson.allCases.filter { person in
                !(number == .dual && person == .third) // Exclude third dual
            }, id: \.self) { person in
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
            ForEach(GrammaticalMood.allCases.filter { mood in
                !(mood == .imperative && tense == .past) // Hide imperative only for past tense
            }, id: \.self) { mood in
                let form = inflections[tense]?[mood]?[number]?[person] ?? "-"
                Text(form)
                    .frame(maxWidth: .infinity)
            }
        }
        .background(Color(UIColor.systemGray6).opacity(0.1))
    }
}
