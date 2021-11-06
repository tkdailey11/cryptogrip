//
//  PassView.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 10/27/21.
//

import SwiftUI

struct PassView: View {
    
    @ObservedObject var viewModel: PassViewModel = PassViewModel(urlStr: "otpauth://totp/test?secret=6ahbhayvbxzkkbpz4gbefgo42vxxpjfyrv6w3jzq7iq2qefychxfgxej&algorithm=SHA512&digits=6&period=30&lock=false")
    
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
                    Text(viewModel.passcode)
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
        PassView()
    }
}
