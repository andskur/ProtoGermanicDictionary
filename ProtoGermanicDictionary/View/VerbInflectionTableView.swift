//
//  VerbInflectionTableView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 14/11/2024.
//

import SwiftUI

struct VerbInflectionTableView: View {
    var inflections: [GrammaticalTense: [GrammaticalMood: [GrammaticalNumber: [GrammaticalPerson: String]]]]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Verb Inflection Table")
                .font(.headline)
                .padding(.bottom, 8)

            // Loop through all tenses
            ForEach(GrammaticalTense.allCases, id: \.self) { tense in
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(tense.rawValue) Tense")
                        .font(.subheadline)
                        .padding(.vertical, 5)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    #if os(iOS)
                        .background(Color(UIColor.systemGray5))
                    #endif
                    
                    tenseHeaderRow(for: tense)
                    
                    // Loop through grammatical numbers and display inflection rows for the current tense
                    ForEach(GrammaticalNumber.allCases, id: \.self) { number in
                        verbInflectionRow(number: number, tense: tense)
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .frame(maxWidth: .infinity)
        
        #if os(iOS)
        .background(Color(UIColor.systemGray6).opacity(0.2))
        #endif
        .cornerRadius(10)
    }
    
    private func tenseHeaderRow(for tense: GrammaticalTense) -> some View {
        HStack {
            Text("") // Empty cell for alignment
                .frame(width: 80, alignment: .leading) // Adjusted width for first column
            
            // Loop through moods to create headers
            ForEach(GrammaticalMood.allCases.filter { mood in
                !(mood == .imperative && tense == .past) // Exclude imperative for past tense only
            }, id: \.self) { mood in
                Text(mood.rawValue)
                    .frame(maxWidth: .infinity)
                    .font(.subheadline.weight(.medium))
                    .multilineTextAlignment(.center)
            }
        }
        
        #if os(iOS)
        .background(Color(UIColor.systemGray5))
        #endif
        .padding(.vertical, 4)
    }
    
    // Generate inflection rows for each grammatical person within the specified tense
    private func verbInflectionRow(number: GrammaticalNumber, tense: GrammaticalTense) -> some View {
        VStack(spacing: 0) {
            ForEach(GrammaticalPerson.allCases.filter { person in
                !(number == .dual && person == .third) && person != .reflexive
            }, id: \.self) { person in
                personInflectionRow(person: person, number: number, tense: tense)
                
                #if os(iOS)
                    .background(Color(UIColor.systemGray6).opacity(0.05)) // Subtle row background
                #endif
            }
        }
    }
    
    private func personInflectionRow(person: GrammaticalPerson, number: GrammaticalNumber, tense: GrammaticalTense) -> some View {
        HStack(spacing: 0) {
            VStack(spacing: 2) {
                Text(person.rawValue)
                Text(number.rawValue.lowercased())
            }
            .frame(width: 80, alignment: .center) // Adjusted width for the first column
            .padding(.vertical, 4)
            
            #if os(iOS)
            .background(Color(UIColor.systemGray5).opacity(0.3))
            #endif
            .font(.caption) // Slightly smaller font for multi-line text
            .multilineTextAlignment(.center)
            
            Divider() // Add a divider between columns
            
            // Loop through each mood to fill in the cells
            ForEach(GrammaticalMood.allCases.filter { mood in
                !(mood == .imperative && tense == .past) // Hide imperative only for past tense
            }, id: \.self) { mood in
                let form = inflections[tense]?[mood]?[number]?[person] ?? "-"
                Text(form)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 4)
                    .font(.callout) // Slightly smaller text
                    .multilineTextAlignment(.center)
            }
        }
        .padding(.vertical, 6)
        
        #if os(iOS)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(UIColor.systemGray4)),
            alignment: .bottom // Row separator
        )
        #endif
    }
}
