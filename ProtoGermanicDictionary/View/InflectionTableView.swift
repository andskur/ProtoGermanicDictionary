//
//  InflectionTableView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 11/11/2024.
//

import SwiftUI

struct InflectionTableView: View {
    var inflections: [GrammaticalCase: [GrammaticalNumber: String]]

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
                Text(GrammaticalNumber.singular.rawValue)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.systemGray5))
                Divider()
                Text(GrammaticalNumber.plural.rawValue)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.systemGray5))
            }
            .background(Color(UIColor.systemGray5))

            // Rows for each grammatical case
            ForEach(GrammaticalCase.allCases.indices, id: \.self) { index in
                let grammaticalCase = GrammaticalCase.allCases[index]
                inflectionRow(for: grammaticalCase)
                    .background(index.isMultiple(of: 2) ? Color(UIColor.systemGray6).opacity(0.1) : Color.clear)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemGray6).opacity(0.2))
        .cornerRadius(8)
    }

    private func inflectionRow(for grammaticalCase: GrammaticalCase) -> some View {
        HStack(spacing: 0) {
            Text(grammaticalCase.rawValue)
                .frame(width: 120, height: 40, alignment: .leading)
                .background(Color(UIColor.systemGray5))
                .font(.subheadline.weight(.medium))
                .foregroundColor(.primary)

            Divider()

            let singular = inflections[grammaticalCase]?[.singular] ?? "-"
            let plural = inflections[grammaticalCase]?[.plural] ?? "-"

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
