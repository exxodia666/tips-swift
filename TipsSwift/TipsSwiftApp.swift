//
//  TipsSwiftApp.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 30.07.2022.
//

import SwiftUI

@main
struct TipsSwiftApp: App {
    @StateObject private var tipsState = TipsState()
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            TodoListScreen()
                .environmentObject(tipsState)
                .environmentObject(dataController)
        }
    }
}
