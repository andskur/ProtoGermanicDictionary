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
                let filteredMoods = GrammaticalMood.allCases.filter { !(tense == .past && $0 == .imperative) }

                TableSection(
                    sectionTitle: "\(tense.rawValue.capitalized) Tense",
                    rows: Conjugation.allCases, // Use Conjugation enum
                    columns: filteredMoods,
                    leadingColumnTitle: "Conjugation",
                    valueForCell: { conjugation, mood in
                        let (number, person) = conjugation.components
                        return inflections[tense]?[mood]?[number]?[person] ?? "-"
                    }
                )
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemGray6).opacity(0.2))
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}
