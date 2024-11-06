//
//  WordListViewModel.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 01/11/2024.
//

import SwiftUI

struct WordListView: View {
    @ObservedObject var viewModel: WordListViewModel
    @State private var selectedLetter: String? = nil

    var body: some View {
        MainWordList(viewModel: viewModel, selectedLetter: $selectedLetter)
    }
}

import SwiftUI

struct LetterSidebar: View {
    @ObservedObject var viewModel: WordListViewModel
    @Binding var selectedLetter: String?

#if os(iOS)
    private var fontSize: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        switch screenWidth {
        case ...375:
            return 11 // Smaller iPhones (e.g., iPhone SE, iPhone 12 mini)
        case 376...410:
            return 13 // Standard iPhones (e.g., iPhone 14)
        default:
            return 16 // Pro Max or larger devices
        }
    }
#else
    private var fontSize = 20
#endif

    var body: some View {
        VStack {
            ForEach(viewModel.letters, id: \.self) { letter in
                Text(letter)
                    .font(.system(size: fontSize, weight: .bold))
                    .padding(.vertical, 2)
                    .foregroundColor(letter == selectedLetter ? .blue : .primary)
                    .onTapGesture {
                        selectedLetter = letter
                    }
            }
        }
    }
}


struct MainWordList: View {
    @ObservedObject var viewModel: WordListViewModel
    @Binding var selectedLetter: String?

    var body: some View {
        VStack {
            SearchFilterRow(viewModel: viewModel)
            
            if viewModel.isLoading {
                LoadingIndicator()
            } else {
                HStack {
                    LetterSidebar(viewModel: viewModel, selectedLetter: $selectedLetter)
                    WordListContent(viewModel: viewModel, selectedLetter: $selectedLetter)
                }
            }
        }
        #if os(iOS)
        .background(Color(.systemBackground))
        #endif
    }
}

struct WordListContent: View {
    @ObservedObject var viewModel: WordListViewModel
    @Binding var selectedLetter: String?

    var body: some View {
        ScrollViewReader { proxy in
            List {
                ForEach(viewModel.letters, id: \.self) { letter in
                    Section() {
                        ForEach(viewModel.words.filter { $0.title?.first?.uppercased() == letter }, id: \.id) { word in
                            NavigationLink(destination: WordDetailView(word: word)) {
                                WordRow(word: word, showWordType: viewModel.filterWordType == nil)
                            }
                        }
                    }
                    .background(
                        GeometryReader { geo -> Color in
                            let frame = geo.frame(in: .global)
                            DispatchQueue.main.async {
                                if frame.minY < 100 && frame.minY > 0 {
                                    selectedLetter = letter
                                }
                            }
                            return Color.clear
                        }
                    )
                }
            }
            .listStyle(PlainListStyle())
            .onChange(of: selectedLetter) {
                if let selectedLetter = selectedLetter {
                    proxy.scrollTo(selectedLetter, anchor: .top)
                }
            }
        }
        .navigationTitle("Proto-Germanic Words")
    }
}

struct SearchFilterRow: View {
    @ObservedObject var viewModel: WordListViewModel

    var body: some View {
        HStack(spacing: 12) {
            TextField("Search words...", text: $viewModel.searchText)
                .padding(10)
                #if os(iOS)
                .background(Color(UIColor.systemGray6))
                #endif
                .cornerRadius(8)
                .autocorrectionDisabled(true)
                .padding(.horizontal)
            
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
                        #if os(iOS)
                        .fill(Color(UIColor.systemGray6))
                        #endif
                        .frame(width: 44, height: 44)
                        .shadow(radius: 2)
                    
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(.vertical, 10)
    }
}

struct LoadingIndicator: View {
    var body: some View {
        VStack {
            ProgressView("Loading all words...")
                .padding()
            Text("Please wait, this may take a while.")
                .foregroundColor(.gray)
        }
    }
}

struct WordRow: View {
    let word: Word
    let showWordType: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(word.title ?? "Unknown")
                .font(.headline)
                .lineLimit(1)
            
            if let translations = word.translations as? Set<Translation> {
                let filteredTranslations = translations.compactMap { $0.text?.trimmingCharacters(in: .whitespacesAndNewlines) }
                    .filter { !$0.isEmpty }
                
                if !filteredTranslations.isEmpty {
                    Text(filteredTranslations.joined(separator: ", ").prefix(100))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }
            
            if showWordType, let wordType = word.wordType {
                Text(wordType)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 4)
    }
}
