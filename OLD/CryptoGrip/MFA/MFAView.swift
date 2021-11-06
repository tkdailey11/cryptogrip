//
//  MFAView.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 10/26/21.
//

import SwiftUI
import SlideOverCard
import CodeScanner

struct MFAView: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Text("MFA Accounts")
                .font(.largeTitle)
            
            PassView()
            
            Button("Add Account"){
                print("Add")
                self.isPresented = true
            }
            .buttonStyle(BorderedButtonStyle(backgroundColor: .blue, foregroundColor: .white, isDisabled: false))
        }
        .slideOverCard(isPresented: $isPresented, onDismiss: {
            self.isPresented = false
        }, options: [.hideExitButton]) {
            CodeScannerView(codeTypes: [.qr]) { result in
                switch result {
                case .success(let code):
                    print("Found code: \(code)")
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
                self.isPresented = false
            }
        }
    }
}

struct MFAView_Previews: PreviewProvider {
    static var previews: some View {
        MFAView()
    }
}
