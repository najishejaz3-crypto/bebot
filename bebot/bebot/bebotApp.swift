//
//  bebotApp.swift
//  bebot
//
//  Created by najish karim on 03/04/26.
//

import SwiftUI

@main
struct bebotApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(isLoggedIn: .constant(false))
        }
    }
}
