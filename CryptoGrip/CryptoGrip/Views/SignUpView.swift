//
//  SignUpView.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 3/4/21.
//

import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @State var passwordConfirm = ""
    
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
                
                SecureField("Password Confirmation", text: self.$passwordConfirm)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {
                AuthenticationState.shared.signup(email: email, password: password, passwordConfirmation: passwordConfirm)
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.purple)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding(.top, 50)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
