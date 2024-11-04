//
//  WordListView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 04/11/2024.
//

import SwiftUI

struct WordListView: View {
    @ObservedObject var viewModel: WordListViewModel

    var body: some View {
        VStack {
            // Filter menu for word type selection
            Menu {
                Button("All", action: { viewModel.applyFilter(wordType: nil) })
                ForEach(WordType.allCases, id: \.self) { type in
                    Button(type.rawValue) {
                        viewModel.applyFilter(wordType: type)
                    }
                }
            } label: {
                Label(viewModel.filterWordType?.rawValue ?? "Filter by Type", systemImage: "line.3.horizontal.decrease.circle")
                    .font(.headline)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
            }
            .padding()

            // List of words with infinite scrolling
            if viewModel.isLoading && viewModel.words.isEmpty {
                ProgressView("Loading...")
            } else {
                List {
                    ForEach(viewModel.words, id: \.id) { word in
                        NavigationLink(destination: WordDetailView(word: word)) {
                            Text(word.title ?? "Unknown")
                        }
                        .onAppear {
                            if word == viewModel.words.last {
                                viewModel.loadMoreWords()
                            }
                        }
                    }

                    // Loading more indicator
                    if viewModel.isLoadingMore {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    } else if !viewModel.hasMoreData {
                        Text("All words have been loaded.")
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                .navigationTitle("Proto-Germanic Words")
            }
        }
    }
}
ok
