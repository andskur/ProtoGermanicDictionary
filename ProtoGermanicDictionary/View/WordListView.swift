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
            TextField("Search words...", text: $viewModel.searchText)
                .padding(8)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
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

            if viewModel.isLoading {
                VStack {
                    ProgressView("Loading all words...") // Spinner loader
                        .padding()
                    Text("Please wait, this may take a while.")
                        .foregroundColor(.gray)
                }
            } else {
                List(viewModel.words, id: \.id) { word in
                    NavigationLink(destination: WordDetailView(word: word)) {
                        VStack(alignment: .leading) {
                            Text(word.title ?? "Unknown")
                                .font(.headline)
                            
                            // Display translations below the title
                            if let translations = word.translations as? Set<Translation> {
                                Text(translations.map { $0.text ?? "" }.joined(separator: ", "))
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1) // Limit to one line for readability
                            }
                        }
                    }
                }
                .navigationTitle("Proto-Germanic Words")
            }
        }
    }
}
