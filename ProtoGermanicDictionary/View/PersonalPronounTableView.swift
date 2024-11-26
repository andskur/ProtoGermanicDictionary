//
//  PersonalPronounInflectionTableView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 24/11/2024.
//

import SwiftUI

struct PersonalPronounTableView: View {
    var inflections: [GrammaticalNumber: [GrammaticalCase: [GrammaticalPerson: String]]]

    var body: some View {
        renderTable(
            headers: GrammaticalPerson.allCases.filter { $0 != .third }.map { $0.rawValue.capitalized }
        ) { grammaticalCase, number, header in
            let person = GrammaticalPerson(rawValue: header.lowercased())!
            return inflections[number]?[grammaticalCase]?[person] ?? "-"
        }
    }

    private func renderTable(
        headers: [String],
        valueForCell: @escaping (GrammaticalCase, GrammaticalNumber, String) -> String
    ) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(GrammaticalNumber.allCases, id: \.self) { number in
                let filteredCases = GrammaticalCase.allCases.filter { grammaticalCase in
                    inflections[number]?[grammaticalCase]?.values.contains(where: { $0 != "-" }) == true
                }

                if !filteredCases.isEmpty {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(number.rawValue.capitalized)
                            .font(.subheadline)
                            .bold()
                            .padding(.vertical, 6)
                            .background(Color(UIColor.systemGray5))

                        renderHeaderRow(headers: headers)

                        ForEach(filteredCases, id: \.self) { grammaticalCase in
                            renderRow(
                                grammaticalCase: grammaticalCase,
                                headers: headers,
                                number: number,
                                valueForCell: valueForCell
                            )
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
        }
    }

    private func renderHeaderRow(headers: [String]) -> some View {
        HStack(spacing: 0) {
            Text("Grammatical Case")
                .frame(width: 150, alignment: .leading)
                .font(.subheadline)
                .background(Color(UIColor.systemGray6))
            ForEach(headers, id: \.self) { header in
                Text(header)
                    .frame(maxWidth: .infinity)
                    .font(.subheadline)
                    .background(Color(UIColor.systemGray6))
            }
        }
    }

    private func renderRow(
        grammaticalCase: GrammaticalCase,
        headers: [String],
        number: GrammaticalNumber,
        valueForCell: @escaping (GrammaticalCase, GrammaticalNumber, String) -> String
    ) -> some View {
        HStack(spacing: 0) {
            Text(grammaticalCase.rawValue.capitalized)
                .frame(width: 150, alignment: .leading)
                .font(.body)
                .background(Color(UIColor.systemGray6))
            ForEach(headers, id: \.self) { header in
                Text(valueForCell(grammaticalCase, number, header))
                    .frame(maxWidth: .infinity)
                    .font(.body)
            }
        }
    }
}
