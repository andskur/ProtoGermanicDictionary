//
//  ProtoGermanicDictionaryApp.swift
//  ProtoGermanicDictionary
//
//  Created by Andrey Skurlatov on 01/11/2024.
//

import SwiftUI

import SwiftUI

@main
struct ProtoGermanicDictionaryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, DataManager.shared.context)
        }
    }
}
