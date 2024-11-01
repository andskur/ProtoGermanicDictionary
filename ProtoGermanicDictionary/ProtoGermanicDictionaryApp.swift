//
//  ProtoGermanicDictionaryApp.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 01/11/2024.
//

import SwiftUI

@main
struct ProtoGermanicDictionaryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
