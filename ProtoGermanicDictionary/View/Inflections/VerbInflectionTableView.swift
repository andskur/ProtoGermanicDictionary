//
//  VerbInflectionTableView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 14/11/2024.
//

import SwiftUI

struct VerbInflectionTableView: View {
    @StateObject private var viewModel: WordInflectionViewModel
    private var inflections: [GrammaticalTense: [GrammaticalMood: [GrammaticalNumber: [GrammaticalPerson: String]]]]
  
    init(word: Word) {
        _viewModel = StateObject(wrappedValue: WordInflectionViewModel(word: word))
        inflections = InflectionService.generateVerbInflections(for: word)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Loop through all tenses
            ForEach(GrammaticalTense.allCases, id: \.self) { tense in
                TableSection(
                    sectionTitle: "\(tense.rawValue.capitalized) Tense",
                    rows: Conjugation.allCases, // Use Conjugation enum
                    columns: viewModel.filterVerbMoods(tense: tense),
                    leadingColumnTitle: "Conjugation",
                    valueForCell: { conjugation, mood in
                        let (number, person) = conjugation.components
                        return inflections[tense]?[mood]?[number]?[person] ?? "-"
                    }
                )
            }
        }
        .frame(maxWidth: .infinity)
        #if os(iOS)
        .background(Color(UIColor.systemGray6).opacity(0.2))
        #endif
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}
