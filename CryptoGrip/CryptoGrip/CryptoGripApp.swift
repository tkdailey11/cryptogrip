//
//  CryptoGripApp.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 3/2/21.
//

import SwiftUI
import Firebase

@main
struct CryptoGripApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        let authState = AuthenticationState.shared
        WindowGroup {
            ContentView()
                .environmentObject(authState)
        }
    }
}
