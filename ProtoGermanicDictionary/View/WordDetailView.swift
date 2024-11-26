//
//  WordDetailView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 01/11/2024.
//

import SwiftUI

struct WordDetailView: View {
    @StateObject private var viewModel: WordDetailViewModel
    
    init(word: Word) {
        _viewModel = StateObject(wrappedValue: WordDetailViewModel(word: word))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.word.title ?? "Unknown")
                    .font(.largeTitle)
                    .bold()
                
                if viewModel.isLoading {
                    ProgressView("Loading details...")
                        .padding(.top, 20)
                } else {
                    if viewModel.wordType != .unknown {
                        Text("Type: \(viewModel.wordType.rawValue)")
                            .font(.headline)
                    } else {
                        Text("Type: Unknown")
                            .font(.headline)
                    }
                    
                    if viewModel.nounGender != nil {
                        Text("Gender: \(viewModel.nounGender!.rawValue)")
                            .font(.subheadline)
                    }
                    
                    if viewModel.nounStem != nil {
                        Text("Stem: \(viewModel.nounStem!.rawValue)")
                            .font(.subheadline)
                    }
                    
                    if viewModel.verbClass != nil {
                        Text("Class: \(viewModel.verbClass!.rawValue)")
                            .font(.subheadline)
                    }
                    
                    if !viewModel.translations.isEmpty {
                        Text("Translations:")
                            .font(.headline)
                            .padding(.top, 10)
                        
                        ForEach(viewModel.translations, id: \.self) { translation in
                            if let text = translation.text, !text.isEmpty {
                                Text("• \(text)")
                                    .padding(.leading, 10)
                            } else {
                                Text("• (No translation)")
                                    .padding(.leading, 10)
                            }
                        }
                    } else {
                        Text("No translations available.")
                            .italic()
                    }
                    
                    if let url = viewModel.word.wiktionaryURL {
                        Link("View on Wiktionary", destination: url)
                            .foregroundColor(.blue)
                            .underline()
                    } else {
                        Text("Wiktionary URL not available.")
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                if viewModel.wordType == .noun {
                    let inflections = viewModel.word.generateNounInflections()
                    NounInflectionTableView(inflections: inflections)
                } else if viewModel.wordType == .verb {
                    let verbInflections = viewModel.word.generateVerbInflections()
                    VerbInflectionTableView(inflections: verbInflections)
                } else if viewModel.wordType == .pronoun {
                    let mockInflections: [GrammaticalNumber: [GrammaticalCase: [GrammaticalPerson: String]]] = [
                        .singular: [
                            .nominative: [
                                .first: "ek",
                                .second: "þū",
                                .reflexive: "se"
                            ],
                            .accusative: [
                                .first: "mek",
                                .second: "þek",
                                .reflexive: "sek"
                            ],
                            .dative: [
                                .first: "miz",
                                .second: "þiz",
                                .reflexive: "siz"
                            ],
                            .genitive: [
                                .first: "mīnaz",
                                .second: "þīnaz",
                                .reflexive: "sīnaz"
                            ]
                        ],
                        .dual: [
                            .nominative: [
                                .first: "wet",
                                .second: "jut, jit",
                                .reflexive: "se"
                            ],
                            .accusative: [
                                .first: "*unk",
                                .second: "*inkw",
                                .reflexive: "sek"
                            ],
                            .dative: [
                                .first: "unkiz",
                                .second: "inkwiz",
                                .reflexive: "siz"
                            ],
                            .genitive: [
                                .first: "unkeraz",
                                .second: "inkweraz",
                                .reflexive: "sīnaz"
                            ]
                        ],
                        .plural: [
                            .nominative: [
                                .first: "wīz",
                                .second: "jūz",
                                .reflexive: "se"
                            ],
                            .accusative: [
                                .first: "uns",
                                .second: "izwiz",
                                .reflexive: "sek"
                            ],
                            .dative: [
                                .first: "unsiz",
                                .second: "izwiz",
                                .reflexive: "siz"
                            ],
                            .genitive: [
                                .first: "unseraz",
                                .second: "izweraz",
                                .reflexive: "se"
                            ]
                        ]
                    ]
                    
                    PronounTableView(inflections: mockInflections)
                    
                }
            }
            .padding()
        }
        .navigationTitle(viewModel.word.title ?? "Word")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}
