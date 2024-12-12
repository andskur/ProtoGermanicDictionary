//
//  PersonalPronounInflectionTableView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 24/11/2024.
//

import SwiftUI

struct AdjectivesTableView: View {
    @StateObject private var viewModel: WordInflectionViewModel
    private var inflections: [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]]
  
    init(word: Word) {
        _viewModel = StateObject(wrappedValue: WordInflectionViewModel(word: word))
        inflections = InflectionService.generateAdjectivesflections(for: word)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Iterate over Grammatical Numbers (e.g., Singular, Dual, Plural)
            ForEach(GrammaticalNumber.allCases, id: \.self) { number in
                let filteredCases = viewModel.filterAdjectivesCases(number: number)
                
                if !filteredCases.isEmpty {
                    TableSection(
                        sectionTitle: number.rawValue.capitalized,
                        rows: filteredCases,
                        columns: GrammaticalGender.allCases,
                        leadingColumnTitle: "Case",
                        valueForCell: { grammaticalCase, gender in
                            inflections[number]?[grammaticalCase]?[gender] ?? "-"
                        }
                    )
                }
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
