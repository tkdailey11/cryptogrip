//
//  PassViewModel.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 11/5/21.
//

import Foundation
import THOTP

class MFAViewModel: ObservableObject, Identifiable {
    @Published var passcodes: [MFAModel] = [MFAModel]()
    
    internal func initWithTestData() {
        let urls: [String] = [
            "",
            "",
            "",
            "",
            "",
            ""
        ]
        
        for u in urls {
            passcodes.append(MFAModel(title: "Title", currentCode: "", passcode: Password.initWithURLString(u)))
        }
    }
    
    internal func refresh() {
        var temp: [MFAModel] = [MFAModel]()
        
        for model in passcodes {
            temp.append(MFAModel(id: model.id, title: model.title, currentCode: model.passcode.currentPassword ?? "000000", passcode: model.passcode))
        }
        
        self.passcodes = temp
    }
}
