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
                Text("") // Empty cell for alignment
                    .frame(width: 120, height: 40, alignment: .leading)
                
                #if os(iOS)
                    .background(Color(UIColor.systemGray5))
                #endif
                Divider()
                Text(GrammaticalNumber.singular.rawValue)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                
                #if os(iOS)
                    .background(Color(UIColor.systemGray5))
                #endif
                Divider()
                Text(GrammaticalNumber.plural.rawValue)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                
                #if os(iOS)
                    .background(Color(UIColor.systemGray5))
                #endif
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

            ForEach(filteredCases.indices, id: \.self) { index in
                let grammaticalCase = filteredCases[index]
                inflectionRow(for: grammaticalCase)
                
                #if os(iOS)
                    .background(index.isMultiple(of: 2) ? Color(UIColor.systemGray6).opacity(0.1) : Color.clear)
                #endif
            }
        }
        .frame(maxWidth: .infinity)
        
        #if os(iOS)
        .background(Color(UIColor.systemGray6).opacity(0.2))
        #endif
        .cornerRadius(8)
    }

    private func inflectionRow(for grammaticalCase: GrammaticalCase) -> some View {
        HStack(spacing: 0) {
            Text(grammaticalCase.rawValue)
                .frame(width: 120, height: 40, alignment: .leading)
            
            #if os(iOS)
                .background(Color(UIColor.systemGray5))
            #endif
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
