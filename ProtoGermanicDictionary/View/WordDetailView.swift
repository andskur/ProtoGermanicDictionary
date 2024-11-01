//
//  WordDetailView.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 01/11/2024.
//

import SwiftUI

struct WordDetailView: View {
    var word: Word

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(word.title ?? "Unknown")
                .font(.largeTitle)
                .bold()
            Spacer()
        }
        .padding()
        .navigationTitle(word.title ?? "Word")
        .navigationBarTitleDisplayMode(.inline)
    }
}
