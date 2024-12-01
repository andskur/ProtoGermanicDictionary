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
                .padding(.bottom, 8)

            // Loop through all tenses
            ForEach(GrammaticalTense.allCases, id: \.self) { tense in
                
                // Mood Header Row
                let filteredMoods = GrammaticalMood.allCases.filter { !(tense == .past && $0 == .imperative) }
                
                renderTenseBlock(
                    tense: tense,
                    filteredMoods: filteredMoods
                )
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemGray6).opacity(0.2))
        .cornerRadius(8)
        .shadow(radius: 2)
    }

    // Helper function to filter valid persons for a given grammatical number
    private func filterPersons(for number: GrammaticalNumber) -> [GrammaticalPerson] {
        GrammaticalPerson.allCases.filter {
            $0 != .reflexive && !(number == .dual && $0 == .third)
        }
    }
    
    private func renderTenseBlock(
        tense: GrammaticalTense,
        filteredMoods: [GrammaticalMood]
    ) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            // Tense Header
            TableSectionHeader(header: tense.rawValue)

            // Mood Header Row
            let filteredMoods = GrammaticalMood.allCases.filter { !(tense == .past && $0 == .imperative) }
            TableHeaderRow(headers: filteredMoods, leadingColumnTitle: "")

            // Render table rows using TableRow
            ForEach(GrammaticalNumber.allCases, id: \.self) { number in
                ForEach(filterPersons(for: number), id: \.self) { person in
                    let rowKey = "\(person.rawValue.capitalized) \(number.rawValue.lowercased())"
                    let valueForCell: (GrammaticalMood) -> String = { mood in
                        inflections[tense]?[mood]?[number]?[person] ?? "-"
                    }

                    TableRow(
                        rowKey: rowKey,
                        columns: filteredMoods,
                        valueForCell: valueForCell
                    )
                }
            }
        }
        .padding(.vertical, 4)
    }
}
