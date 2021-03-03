//
//  ContentView.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 3/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authState: AuthenticationState
    
    var body: some View {
        Group {
            if authState.loggedInUser != nil {
                HomePage()
            } else {
                Text("Auth Screen")
            }
        }
        .animation(.easeInOut)
        .transition(.move(edge: .bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
