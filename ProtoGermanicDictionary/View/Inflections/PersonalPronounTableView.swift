//
//  PersonalPronounInflectionTableView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 24/11/2024.
//

import SwiftUI

struct PersonalPronounTableView: View {
    @StateObject private var viewModel: WordInflectionViewModel
    private var inflections: [GrammaticalNumber: [GrammaticalCase: [GrammaticalPerson: String]]]
  
    init(word: Word) {
        _viewModel = StateObject(wrappedValue: WordInflectionViewModel(word: word))
        inflections = InflectionService.generatePersonalPronounInflections(for: word)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Iterate over Grammatical Numbers (e.g., Singular, Dual, Plural)
            if !inflections.isEmpty {
                ForEach(GrammaticalNumber.allCases, id: \.self) { number in
                    Text(number.rawValue)
                    TableSection(
                        sectionTitle: number.rawValue.capitalized,
                        rows: viewModel.filterPersonalPronounCases(number: number),
                        columns: viewModel.filterPronounPerson(number: number),
                        leadingColumnTitle: "Case",
                        valueForCell: { grammaticalCase, person in
                            inflections[number]?[grammaticalCase]?[person] ?? "-"
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
