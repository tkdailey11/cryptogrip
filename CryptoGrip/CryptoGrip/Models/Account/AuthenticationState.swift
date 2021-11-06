//
//  AuthenticationState.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 3/2/21.
//

import Combine
import AuthenticationServices
import FirebaseAuth

enum LoginOption {
    case signInWithApple
    case emailAndPassword(email: String, password: String)
}

class AuthenticationState: NSObject, ObservableObject {
    @Published var loggedInUser: User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    
    static let shared = AuthenticationState()
    
    private let auth = Auth.auth()
    fileprivate var currentNonce: String?
    
    func login(with loginOption: LoginOption) {
        self.isAuthenticating = true
        self.error = nil
        
        switch loginOption {
        case .signInWithApple:
            handleSignInWithApple()
        case let .emailAndPassword(email: email, password: password):
            handleSignInWith(email: email, password: password)
        }
    }
    
    func signup(email: String, password: String, passwordConfirmation: String) {
    }

    private func handleSignInWith(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.error = error
            } else {
                self.loggedInUser = result?.user
            }
        }
    }

    private func handleSignInWithApple() {
        // TODO
    }
}
