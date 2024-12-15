//
//  VerbInflectionTableView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 14/11/2024.
//

import SwiftUI

struct VerbInflectionTableView: View {
    @StateObject private var viewModel: WordInflectionViewModel
    private var inflectionsVerb: [GrammaticalTense: [GrammaticalMood: [GrammaticalNumber: [GrammaticalPerson: String]]]]
    private var inflectionsParticiplel: [GrammaticalTense: [AdjectiveDeclension: [GrammaticalNumber: [GrammaticalCase: [GrammaticalGender: String]]]]]
    private var word: Word
  
    init(word: Word) {
        self.word = word
        _viewModel = StateObject(wrappedValue: WordInflectionViewModel(word: word))
        inflectionsVerb = InflectionService.generateVerbInflections(for: word)
        inflectionsParticiplel = InflectionService.generateParticiplelIflections(for: word)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Loop through all tenses
            ForEach(GrammaticalTense.allCases, id: \.self) { tense in
                TableSection(
                    sectionTitle: "\(tense.rawValue.capitalized) Tense",
                    rows: Conjugation.allCases, // Use Conjugation enum
                    columns: viewModel.filterVerbMoods(tense: tense),
                    leadingColumnTitle: "Conjugation",
                    valueForCell: { conjugation, mood in
                        let (number, person) = conjugation.components
                        return inflectionsVerb[tense]?[mood]?[number]?[person] ?? "-"
                    }
                )
            }
            
            Divider().padding()
            
            Text("Participle")
            
            HStack {
                ForEach(GrammaticalTense.allCases, id: \.self) { tense in
                    VStack {
                        Text(tense.rawValue).bold()
                        Divider()
                        Text(ParticipleInflectionService.participleForm(tense: tense, verbClass: word.verb ?? .unknown, word: word.title ?? "-"))
                    }
                }
            }
            
            
            ForEach(GrammaticalTense.allCases, id: \.self) { tense in
                Text(tense.rawValue).bold()
                ForEach(AdjectiveDeclension.allCases, id: \.self) { decl in
                    Text(decl.rawValue).bold()
                    // Iterate over Grammatical Numbers (e.g., Singular, Dual, Plural)
                    ForEach(GrammaticalNumber.allCases, id: \.self) { number in
                        let filteredCases = viewModel.filterParticipleCases(number: number, tense: tense, decl: decl)
                        
                        if !filteredCases.isEmpty {
                            TableSection(
                                sectionTitle: number.rawValue.capitalized,
                                rows: filteredCases,
                                columns: GrammaticalGender.allCases,
                                leadingColumnTitle: "Case",
                                valueForCell: { grammaticalCase, gender in
                                    inflectionsParticiplel[tense]?[decl]?[number]?[grammaticalCase]?[gender] ?? "-"
                                }
                            )
                        }
                    }
                    Divider().padding()
                }
                Divider().padding()
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
