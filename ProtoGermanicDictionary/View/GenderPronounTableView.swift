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
        VStack(alignment: .leading, spacing: 0) {
            // Title
            Text("Proto-Germanic Personal Pronouns")
                .font(.headline)
                .padding(.bottom, 8)

            // Iterate over Grammatical Numbers (e.g., Singular, Dual, Plural)
            ForEach(GrammaticalNumber.allCases, id: \.self) { number in
                // Filter cases for the current number
                let filteredCases = GrammaticalCase.allCases.filter { grammaticalCase in
                    // Check if at least one person's value is not "-"
                    inflections[number]?[grammaticalCase]?.values.contains(where: { $0 != "-" }) == true
                }
                
                if !filteredCases.isEmpty {
                    VStack(alignment: .leading, spacing: 0) {
                        // Header for each grammatical number
                        Text(number.rawValue.capitalized)
                            .font(.subheadline)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 6)
                            .background(Color(UIColor.systemGray5))
                            .foregroundColor(.primary)

                        // Header Row
                        renderHeaderRow(headers: filteredCases)

                        // Rows for Grammatical Cases
                        ForEach(filteredCases, id: \.self) { grammaticalCase in
                            HStack(spacing: 0) {
                                // Case Name (Gray Background for Left Column)
                                Text(grammaticalCase.rawValue.capitalized)
                                    .frame(width: 150, alignment: .leading)
                                    .font(.body)
                                    .padding(.vertical, 6)
                                    .background(Color(UIColor.systemGray6)) // Gray background for case column

                                // Inflection Values (excluding third person)
                                ForEach(GrammaticalPerson.allCases.filter { $0 != .third }, id: \.self) { person in
                                    Text(inflections[number]?[grammaticalCase]?[person] ?? "-")
                                        .frame(maxWidth: .infinity)
                                        .font(.body)
                                        .padding(.vertical, 6)
                                        .multilineTextAlignment(.center)
                                        .background(grammaticalCase.hashValue % 2 == 0 ? Color(UIColor.systemGray6).opacity(0.1) : Color.clear)
                                }
                            }
                            .border(Color(UIColor.systemGray4))
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(UIColor.systemGray6).opacity(0.2))
        .cornerRadius(8)
        .shadow(radius: 2)
    }
    
    private func renderHeaderRow(headers: [GrammaticalCase]) -> some View {
        HStack(spacing: 0) {
            // Left Column (Grammatical Case Header)
            Text("Grammatical Case")
                .frame(width: 150, alignment: .leading)
                .font(.subheadline)
                .foregroundColor(.primary)
                .padding(.vertical, 6)
                .background(Color(UIColor.systemGray6)) // Gray background for left column
            // Filter out the third person
            ForEach(GrammaticalPerson.allCases.filter { $0 != .third }, id: \.self) { person in
                Text(person.rawValue.capitalized)
                    .frame(maxWidth: .infinity)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .padding(.vertical, 6)
                    .background(Color(UIColor.systemGray6))
            }
        }
        .border(Color(UIColor.systemGray4))
    }
}
