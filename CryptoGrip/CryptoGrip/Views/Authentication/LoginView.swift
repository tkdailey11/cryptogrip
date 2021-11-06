//
//  LoginView.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 3/2/21.
//

import SwiftUI
import Firebase
import AuthenticationServices

struct LoginView: View {
    @State var email = ""
    @State var password = ""

    var body: some View {
        VStack() {
            AppTitle()
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Email", text: self.$email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                SecureField("Password", text: self.$password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {
                AuthenticationState.shared.login(with: .emailAndPassword(email: email, password: password))
            }){
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.purple)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding(.top, 50)
            
            SignInWithAppleButton(
                onRequest: { request in
                    AuthenticationState.shared.login(with: .signInWithApple)
                },
                onCompletion: { result in
                    print("onCompletion")
                }
            )
            .padding([.leading, .trailing], 50)
            .padding(.top)
            .padding(.bottom, 350)
            
            Spacer()
        }
    }
    
    func login() {
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
