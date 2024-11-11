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
                    InflectionTableView(inflections: [
                        .nominative: (singular: "word_nom_sg", plural: "word_nom_pl"),
                        .vocative: (singular: "word_voc_sg", plural: "word_voc_pl"),
                        .accusative: (singular: "word_acc_sg", plural: "word_acc_pl"),
                        .genitive: (singular: "word_gen_sg", plural: "word_gen_pl"),
                        .dative: (singular: "word_dat_sg", plural: "word_dat_pl"),
                        .instrumental: (singular: "word_inst_sg", plural: "word_inst_pl")
                    ])
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
