//
//  MFAScreen.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 11/5/21.
//

import SwiftUI
import SlideOverCard
import CodeScanner

struct MFAScreen: View {
    @State var isPresented: Bool = false
    @State var viewModel: MFAViewModel = MFAViewModel()
    
    var body: some View {
        VStack {
            Text("MFA Accounts")
                .font(.largeTitle)

            GridView(viewModel: viewModel)
            
            Button("Add Account"){
                //self.isPresented = true
                self.viewModel.refresh()
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
        .onAppear(perform: {
            //replace this with a timer based method to update model
            self.viewModel.initWithTestData()
        })
    }
}

struct MFAScreen_Previews: PreviewProvider {
    static var screen = MFAScreen()
    static var previews: some View {
        screen.viewModel.initWithTestData()
        return screen
    }
}
