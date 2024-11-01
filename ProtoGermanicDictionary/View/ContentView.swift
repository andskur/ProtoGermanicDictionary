//
//  ContentView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 01/11/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var context
    @StateObject private var viewModel: WordListViewModel

    init() {
        let viewModel = WordListViewModel(context: DataManager.shared.context)
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else {
                List {
                    ForEach(viewModel.words, id: \.id) { word in
                        NavigationLink(destination: WordDetailView(word: word)) {
                            Text(word.title ?? "Unknown")
                        }
                    }
                }
                .navigationTitle("Proto-Germanic Words")
            }
        }
    }
}
