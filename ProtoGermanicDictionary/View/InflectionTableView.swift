//
//  InflectionTableView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 11/11/2024.
//

import SwiftUI

struct InflectionTableView: View {
    var inflections: [GrammaticalCase: (singular: String, plural: String)]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Inflection Table")
                .font(.headline)
                .padding(.bottom, 5)

            // Header row
            HStack(spacing: 0) {
                Text("") // Empty cell for alignment
                    .frame(width: 120, height: 40, alignment: .leading)
                    .background(Color(UIColor.systemGray5))
                Divider()
                Text("Singular")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.systemGray5))
                Divider()
                Text("Plural")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.systemGray5))
            }
            .background(Color(UIColor.systemGray5))

            // Rows for each grammatical case with alternating background color
            ForEach(GrammaticalCase.allCases.indices, id: \.self) { index in
                let grammaticalCase = GrammaticalCase.allCases[index]
                inflectionRow(for: grammaticalCase)
                    .background(index.isMultiple(of: 2) ? Color(UIColor.systemGray6).opacity(0.1) : Color.clear)
            }
        }
        .frame(maxWidth: .infinity) // Expands the entire table to fill available width
        .background(Color(UIColor.systemGray6).opacity(0.2))
        .cornerRadius(8)
    }

    // Helper function for each row
    private func inflectionRow(for grammaticalCase: GrammaticalCase) -> some View {
        HStack(spacing: 0) {
            Text(grammaticalCase.rawValue)
                .frame(width: 120, height: 40, alignment: .leading)
                .padding(.leading, 8) // Add left padding here
                .background(Color(UIColor.systemGray5)) // Full background for left column
                .font(.subheadline.weight(.medium))
                .foregroundColor(.primary)

            Divider()

            let singular = inflections[grammaticalCase]?.singular ?? "-"
            let plural = inflections[grammaticalCase]?.plural ?? "-"

            Text(singular)
                .frame(maxWidth: .infinity, minHeight: 40)
                .multilineTextAlignment(.center)

            Divider()

            Text(plural)
                .frame(maxWidth: .infinity, minHeight: 40)
                .multilineTextAlignment(.center)
        }
    }
}

struct InflectionTableView_Previews: PreviewProvider {
    static var previews: some View {
        InflectionTableView(inflections: [
            .nominative: ("*dagaz", "*dagōz"),
            .vocative: ("*dag", "*dagōz"),
            .accusative: ("*dagą", "*daganz"),
            .genitive: ("*dagas", "*dagô"),
            .dative: ("*dagai", "*dagamaz"),
            .instrumental: ("*dagō", "*dagamiz")
        ])
    }
}
