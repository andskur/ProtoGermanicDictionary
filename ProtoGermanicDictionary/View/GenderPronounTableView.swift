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
                
                if !filteredCases.isEmpty {
                    renderNumberBlock(number: number, filteredCases: filteredCases, inflections: inflections[number] ?? [:])
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
    
    
    private func renderNumberBlock(number: GrammaticalNumber, filteredCases: [GrammaticalCase], inflections: [GrammaticalCase: [GrammaticalGender: String]]) -> some View {
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
            renderHeaderRow(headers: filteredCases)

            // Rows for Grammatical Cases
            ForEach(filteredCases, id: \.self) { grammaticalCase in
                renderRow(grammaticalCase: grammaticalCase, inflections: inflections)
            }
        }
        .padding(.vertical, 4)
    }
    
    private func renderHeaderRow(headers: [GrammaticalCase]) -> some View {
        HStack(spacing: 0) {
            // Left Column (Grammatical Case Header)
            Text("Case")
                .frame(width: 100, alignment: .leading)
                .font(.subheadline)
                .foregroundColor(.primary)
                .padding(.vertical, 6)
            #if os(iOS)
                .background(Color(UIColor.systemGray6)) // Gray background for left column
            #endif
            // Filter out the third person
            ForEach(GrammaticalGender.allCases, id: \.self) { gender in
                Text(gender.rawValue.capitalized)
                    .frame(maxWidth: .infinity)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .padding(.vertical, 6)
                
                #if os(iOS)
                    .background(Color(UIColor.systemGray6))
                #endif
            }
        }
        #if os(iOS)
        .border(Color(UIColor.systemGray4))
        #endif
    }
    
    private func renderRow(grammaticalCase: GrammaticalCase, inflections: [GrammaticalCase: [GrammaticalGender: String]]) -> some View {
        HStack(spacing: 0) {
            // Case Name (Gray Background for Left Column)
            Text(grammaticalCase.rawValue.capitalized)
                .frame(width: 100, alignment: .leading)
                .font(.body)
                .padding(.vertical, 6)
            
            #if os(iOS)
                .background(Color(UIColor.systemGray6)) // Gray background for case column
            #endif

            // Inflection Values (excluding third person)
            ForEach(GrammaticalGender.allCases, id: \.self) { gender in
                Text(inflections[grammaticalCase]?[gender] ?? "-")
                    .frame(maxWidth: .infinity)
                    .font(.body)
                    .padding(.vertical, 6)
                    .multilineTextAlignment(.center)
                
                #if os(iOS)
                    .background(grammaticalCase.hashValue % 2 == 0 ? Color(UIColor.systemGray6).opacity(0.1) : Color.clear)
                #endif
            }
        }
        #if os(iOS)
        .border(Color(UIColor.systemGray4))
        #endif
    }
}
