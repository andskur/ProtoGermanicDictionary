//
//  PersonalPronounInflectionTableView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 24/11/2024.
//

import SwiftUI

struct GenderPronounTableView: View {
    var inflections: [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Title
            Text("Proto-Germanic Pronouns")
                .font(.headline)
                .padding(.bottom, 8)

            // Iterate over Grammatical Numbers (e.g., Singular, Dual, Plural)
            ForEach(GrammaticalNumber.allCases, id: \.self) { number in
                // Filter cases for the current number
                let filteredCases = GrammaticalCase.allCases.filter { grammaticalCase in
                    // Check if at least one person's value is not "-"
                    inflections[number]?[grammaticalCase]?.values.contains(where: { $0 != "-" }) == true
                }
                
                // Filter persons for the current number and filtered cases
                let filteredGenders = GrammaticalGender.allCases.filter { gender in
                    let gendersValues = filteredCases.compactMap { grammaticalCase in
                        inflections[number]?[grammaticalCase]?[gender]
                    }
                    return gendersValues.contains(where: { $0 != "-" && $0 != "" })
                }
                
                if !filteredCases.isEmpty {
                    renderNumberBlock(
                        number: number,
                        filteredCases: filteredCases,
                        filteredGenders: filteredGenders,
                        inflections: inflections[number] ?? [:]
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
    
    private func renderNumberBlock(
        number: GrammaticalNumber,
        filteredCases: [GrammaticalCase],
        filteredGenders: [GrammaticalGender],
        inflections: [GrammaticalCase: [GrammaticalGender: String]]
    ) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header for each grammatical number
            Text(number.rawValue.capitalized)
                .font(.subheadline)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 6)
                #if os(iOS)
                .background(Color(UIColor.systemGray5))
                #endif
                .foregroundColor(.primary)

            // Header Row
            TableHeaderRow(
                headers: filteredGenders,
                leadingColumnTitle: "Case"
            )

            // Rows for Grammatical Cases
            ForEach(filteredCases, id: \.self) { grammaticalCase in
                TableRow(
                    rowKey: grammaticalCase.rawValue.capitalized,
                    columns: filteredGenders,
                    valueForCell: { gender  in
                        inflections[grammaticalCase]?[gender] ?? "-"
                    }
                )
            }
        }
        .padding(.vertical, 4)
    }
}
