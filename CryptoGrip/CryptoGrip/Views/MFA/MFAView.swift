//
//  PassView.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 11/5/21.
//

import SwiftUI
import THOTP

struct MFAView: View {
    
    var viewModel: MutatingSecurable
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 9).foregroundColor(.accentColor)
            HStack {
                Image(systemName: "lock.rotation")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
                VStack {
                    Spacer()
                    Text(viewModel.title)
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                    Text(viewModel.passcode.currentPassword ?? "")
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .padding()
            
        }
        .frame(height: 100)
        .padding()
        
    }
}

struct PassView_Previews: PreviewProvider {
    static var previews: some View {
        MFAView(viewModel: MFAModel(title: "Some Title", currentCode: "", passcode: Password.initWithURLString("")))
    }
}
