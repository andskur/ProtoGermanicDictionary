//
//  InflectionTableView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 11/11/2024.
//

import SwiftUI

struct NounInflectionTableView: View {
    @StateObject private var viewModel: WordInflectionViewModel
    private var inflections: [GrammaticalCase: [GrammaticalNumber: String]]
    
    init(word: Word) {
        _viewModel = StateObject(wrappedValue: WordInflectionViewModel(word: word))
        inflections = InflectionService.generateNounInflections(for: word)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header row
            HStack(spacing: 0) {
                // Header Row
                TableHeaderRow(
                    headers: [GrammaticalNumber.singular, GrammaticalNumber.plural],
                    leadingColumnTitle: "Case"
                )
            }
            #if os(iOS)
            .background(Color(UIColor.systemGray5))
            #endif
            
            ForEach(viewModel.filterNounCases(), id: \.self) { grammaticalCase in
                TableRow(
                    rowKey: grammaticalCase.rawValue.capitalized,
                    columns: [GrammaticalNumber.singular, GrammaticalNumber.plural],
                    valueForCell: { value  in
                        inflections[grammaticalCase]?[value] ?? "-"
                    }
                )
            }
        }
        .frame(maxWidth: .infinity)
        
        #if os(iOS)
        .background(Color(UIColor.systemGray6).opacity(0.2))
        #endif
    }
}
