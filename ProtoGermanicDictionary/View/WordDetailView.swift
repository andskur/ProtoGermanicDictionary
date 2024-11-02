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
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.word.title ?? "Unknown")
                .font(.largeTitle)
                .bold()
            
            if viewModel.isLoading {
                ProgressView("Loading details...")
            } else {
                if viewModel.wordType != .unknown {
                    Text("Type: \(viewModel.wordType.rawValue)")
                } else {
                    Text("Type: Unknown")
                }
                if !viewModel.translations.isEmpty {
                    Text("Translations:")
                        .font(.headline)
                    ForEach(viewModel.translations, id: \.self) { translation in
                        Text("• \(translation.text ?? "")")
                            .padding(.leading, 10)
                    }
                } else {
                    Text("No translations available.")
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle(viewModel.word.title ?? "Word")
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}
