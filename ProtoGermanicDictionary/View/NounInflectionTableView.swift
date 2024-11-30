//
//  InflectionTableView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 11/11/2024.
//

import SwiftUI

struct NounInflectionTableView: View {
    var inflections: [GrammaticalCase: [GrammaticalNumber: String]]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Inflection Table")
                .font(.headline)
                .padding(.bottom, 5)

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

            // Filtered rows for each grammatical case
            let filteredCases = GrammaticalCase.allCases.filter { grammaticalCase in
                // Check if at least one value is not "-"
                let singular = inflections[grammaticalCase]?[.singular] ?? "-"
                let plural = inflections[grammaticalCase]?[.plural] ?? "-"
                return singular != "-" || plural != "-"
            }

            ForEach(filteredCases, id: \.self) { grammaticalCase in
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
