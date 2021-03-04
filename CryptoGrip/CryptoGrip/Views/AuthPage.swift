//
//  AuthPage.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 3/4/21.
//

import SwiftUI

struct AuthPage: View {
    
    @State var isOnLoginPage: Bool = true
    
    var body: some View {
        VStack {
            if(isOnLoginPage){
                LoginView()
            }
            else {
                HStack {
                    Spacer()
                    SignUpView()
                    Spacer()
                }
            }
            
            Spacer()
            
            HStack(spacing: 0) {
                if(isOnLoginPage){
                    Text("Don't have an account? ")
                        .foregroundColor(.white)
                }
                else {
                    Text("Already have an account? ")
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    isOnLoginPage.toggle()
                }) {
                    if(isOnLoginPage){
                        Text("Sign Up")
                            .foregroundColor(.white)
                    }
                    else {
                        Text("Sign In")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
    }
}

struct AuthPage_Previews: PreviewProvider {
    static var previews: some View {
        AuthPage()
    }
}

struct AppTitle: View {
    var body: some View {
        Text("CryptoGrip")
            .font(.largeTitle).foregroundColor(Color.white)
            .padding([.top, .bottom], 40)
            .shadow(radius: 10.0, x: 20, y: 10)
    }
}

