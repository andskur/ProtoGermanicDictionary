//
//  TableRow.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 28/11/2024.
//

import SwiftUI

struct TableRow<RowKeyType: Hashable, ColumnKeyType: Hashable>: View {
    let rowKey: RowKeyType
    let columns: [ColumnKeyType]
    let valueForCell: (ColumnKeyType) -> String // Closure to fetch the cell value

    var body: some View {
        HStack(spacing: 0) {
            // Case Name (Gray Background for Left Column)
            Text("\(rowKey)")
                .frame(width: 100, alignment: .leading)
                .font(.body)
                .padding(.vertical, 6)
            
            #if os(iOS)
                .background(Color(UIColor.systemGray6)) // Gray background for case column
            #endif

            // Inflection Values (excluding third person)
            ForEach(columns, id: \.self) { column in
                Text(valueForCell(column))
                    .frame(maxWidth: .infinity)
                    .font(.body)
                    .padding(.vertical, 6)
                    .multilineTextAlignment(.center)
                
                #if os(iOS)
                    .background(Color(UIColor.systemGray6).opacity(0.1))
                #endif
            }
        }
        #if os(iOS)
        .border(Color(UIColor.systemGray4))
        #endif
    }
}
