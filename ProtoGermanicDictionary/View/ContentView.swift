//
//  ContentView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 01/11/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var context
    @StateObject private var viewModel = WordListViewModel()

    var body: some View {
        NavigationView {
            WordListView(viewModel: viewModel)
                .navigationTitle("Proto-Germanic Dictionary")
                .onAppear {
                    // Ensure initial data load if necessary
                    if viewModel.words.isEmpty && !viewModel.isLoading {
                        viewModel.preloadAllWordsWithDetails()
                    }
                }
        }
    }
}
