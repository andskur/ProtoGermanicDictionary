import SwiftUI

struct WordListView: View {
    @ObservedObject var viewModel: WordListViewModel

    var body: some View {
        VStack {
            // Search and Filter Row
            HStack(spacing: 12) {
                // Search TextField
                TextField("Search words...", text: $viewModel.searchText)
                    .padding(10)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8)
                    .autocorrectionDisabled(true)
                    .padding(.horizontal)
                
                // Filter Menu Button
                Menu {
                    Button("All", action: { viewModel.applyFilter(wordType: nil) })
                    ForEach(WordType.allCases, id: \.self) { type in
                        Button(type.rawValue) {
                            viewModel.applyFilter(wordType: type)
                        }
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(UIColor.systemGray6))
                            .frame(width: 44, height: 44)
                            .shadow(radius: 2)
                        
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.vertical, 10)
            
            // Loading Indicator
            if viewModel.isLoading {
                VStack {
                    ProgressView("Loading all words...")
                        .padding()
                    Text("Please wait, this may take a while.")
                        .foregroundColor(.gray)
                }
            } else {
                // List of Words
                List(viewModel.words, id: \.id) { word in
                    NavigationLink(destination: WordDetailView(word: word)) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(word.title ?? "Unknown")
                                .font(.headline)
                                .lineLimit(1)
                            
                            if let translations = word.translations as? Set<Translation> {
                                let filteredTranslations = translations
                                    .compactMap { $0.text?.trimmingCharacters(in: .whitespacesAndNewlines) }
                                    .filter { !$0.isEmpty }
                                
                                if !filteredTranslations.isEmpty {
                                    Text(filteredTranslations.joined(separator: ", ").prefix(100))
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                }
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Proto-Germanic Words")
            }
        }
        .background(Color(.systemBackground)) // Adds a unified background color for the view
    }
}
