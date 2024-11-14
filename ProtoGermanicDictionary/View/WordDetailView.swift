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
                    let inflections = viewModel.word.generateInflections()
                    NounInflectionTableView(inflections: inflections)
                } else if viewModel.wordType == .verb {
                    if viewModel.wordType == .verb {
                        let verbInflections: [GrammaticalTense: [GrammaticalMood: [GrammaticalNumber: [GrammaticalPerson: String]]]] = [
                            .present: [
                                .indicative: [
                                    .singular: [
                                        .first: "*bīđō",
                                        .second: "*bīđizi",
                                        .third: "*bīđidi"
                                    ],
                                    .dual: [
                                        .first: "*bīđōz",
                                        .second: "*bīđadiz",
                                        .third: "*bīđandōz"
                                    ],
                                    .plural: [
                                        .first: "*bīđamaz",
                                        .second: "*bīđid",
                                        .third: "*bīđandi"
                                    ]
                                ],
                                .subjunctive: [
                                    .singular: [
                                        .first: "*bīđau",
                                        .second: "*bīđaiz",
                                        .third: "*bīđai"
                                    ],
                                    .dual: [
                                        .first: "*bīđaiw",
                                        .second: "*bīđaidiz",
                                        .third: "*bīđaidōz"
                                    ],
                                    .plural: [
                                        .first: "*bīđaim",
                                        .second: "*bīđaid",
                                        .third: "*bīđain"
                                    ]
                                ],
                                .imperative: [
                                    .singular: [
                                        .second: "*bīđ"
                                    ],
                                    .dual: [
                                        .second: "*bīđadiz"
                                    ],
                                    .plural: [
                                        .second: "*bīđid"
                                    ]
                                ]
                            ],
                            .past: [
                                .indicative: [
                                    .singular: [
                                        .first: "*baid",
                                        .second: "*baist",
                                        .third: "*baid"
                                    ],
                                    .dual: [
                                        .first: "*bidū",
                                        .second: "*bidudiz"
                                    ],
                                    .plural: [
                                        .first: "*bidum",
                                        .second: "*bidud",
                                        .third: "*bidun"
                                    ]
                                ],
                                .subjunctive: [
                                    .singular: [
                                        .first: "*bidjau",
                                        .second: "*bidjiz",
                                        .third: "*bidjē"
                                    ],
                                    .dual: [
                                        .first: "*bidjwē",
                                        .second: "*bidjizwē"
                                    ],
                                    .plural: [
                                        .first: "*bidjēmu",
                                        .second: "*bidjēdu",
                                        .third: "*bidjēn"
                                    ]
                                ]
                            ]
                        ]

                        VerbInflectionTableView(inflections: verbInflections)
                    }

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
