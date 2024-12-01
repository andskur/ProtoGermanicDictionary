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
                let filteredPersons = GrammaticalPerson.allCases.filter { person in
                    let personValues = filteredCases.compactMap { grammaticalCase in
                        inflections[number]?[grammaticalCase]?[person]
                    }
                    return personValues.contains(where: { $0 != "-" && $0 != "" })
                }
                
                if !filteredCases.isEmpty {
                    TableSection(
                        sectionTitle: number.rawValue.capitalized,
                        rows: filteredCases,
                        columns: filteredPersons,
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
