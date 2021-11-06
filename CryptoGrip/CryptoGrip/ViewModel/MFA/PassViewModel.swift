//
//  PassViewModel.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 11/5/21.
//

import Foundation

class PassViewModel: ObservableObject, Identifiable {
    @Published var title: String
    @Published var passcode: String
    
    private var model: PassModel
    
    init(urlStr: String) {
        self.model = PassModel(urlStr: urlStr)
        self.title = model.passcode.name
        self.passcode = model.passcode.currentPassword ?? "000000"
        if #available(iOS 15, *) {
            print(Date.now.timeIntervalSince1970)
        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.passcode != self.model.passcode.currentPassword {
                if #available(iOS 15, *) {
                    print(Date.now.timeIntervalSince1970)
                }
            }
            self.passcode = self.model.passcode.currentPassword ?? "000000"
            
        }
    }
}

