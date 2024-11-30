//
//  TableHeaderRow.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 28/11/2024.
//

import SwiftUI

struct TableHeaderRow<HeaderType: Hashable>: View {
    let headers: [HeaderType]
    let leadingColumnTitle: String? // Optional title for the first column

    var body: some View {
        HStack(spacing: 0) {
            if let leadingColumnTitle = leadingColumnTitle {
                Text(leadingColumnTitle.capitalized)
                    .frame(width: 100, alignment: .leading)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .padding(.vertical, 6)
                #if os(iOS)
                    .background(Color(UIColor.systemGray6)) // Gray background for left column
                #endif
            }

            ForEach(headers, id: \.self) { header in
                Text("\(header)".capitalized)
                    .frame(maxWidth: .infinity)
                    .font(.subheadline)
                    .padding(.vertical, 6)
                    .foregroundColor(.primary)
//                    .bold()
                    .multilineTextAlignment(.center)
                    #if os(iOS)
                        .background(Color(UIColor.systemGray6))
                    #endif
            }
        }
        #if os(iOS)
        .border(Color(UIColor.systemGray4))
        #endif
    }
}
