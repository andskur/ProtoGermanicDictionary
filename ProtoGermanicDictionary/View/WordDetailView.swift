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
                    let pronounInflections = viewModel.word.generatePronounInflections()
                    
                    if pronounInflections != [:] {
                        PronounTableView(inflections: pronounInflections)
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
