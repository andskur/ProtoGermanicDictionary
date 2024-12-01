//
//  TableSectionHeader.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 30/11/2024.
//

import SwiftUI

struct TableSectionHeader: View {
    var header: String

    var body: some View {
        Text("\(header.capitalized)")
            .font(.subheadline)
            .bold()
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity, alignment: .leading)
            #if os(iOS)
            .background(Color(UIColor.systemGray5))
            #endif
            .foregroundColor(.primary)
    }
}
