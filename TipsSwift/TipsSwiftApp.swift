//
//  TipsSwiftApp.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 30.07.2022.
//

import SwiftUI
import Firebase

@main
struct TipsSwiftApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContenView()
        }
    }
}
