//
//  TableSections.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 30/11/2024.
//

import SwiftUI

struct TableSection<ColumnKeyType: Hashable, RowKeyType: Hashable>: View {
    let sectionTitle: String
    let rows: [RowKeyType] // Define rows as an array of generic keys
    let columns: [ColumnKeyType] // Define columns as an array of generic keys
    let leadingColumnTitle: String
    let valueForCell: (RowKeyType, ColumnKeyType) -> String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Section Title
            TableSectionHeader(header: sectionTitle)

            // Table Header Row
            TableHeaderRow(headers: columns, leadingColumnTitle: leadingColumnTitle)

            // Rows
            ForEach(rows, id: \.self) { row in
                TableRow<ColumnKeyType>(
                    rowKey: String(describing: row), // Convert `RowKeyType` to String
                    columns: columns,
                    valueForCell: { column in
                        valueForCell(row, column)
                    }
                )
            }
        }
        .padding(.vertical, 4)
    }
}
