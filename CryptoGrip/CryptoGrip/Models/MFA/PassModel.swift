//
//  PassModel.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 11/5/21.
//

import Foundation
import THOTP

struct PassModel {
    var passcode: Password
    
    init(urlStr: String) {
        let testPassword = Password(name: "test", issuer: nil, image: nil, generator: TestGenerator())
        do {
            if let url = URL(string: urlStr) {
                self.passcode = try Password(url: url)
            } else {
                self.passcode = testPassword
            }
        }
        catch {
            self.passcode = testPassword
        }
    }
}

class TestGenerator: GeneratorProtocol {
    var secret: Data
    var digits: Int
    var generatorAlgorithm: GeneratorAlgorithm
    var hashAlgorithm: SupportedHashAlgorithm
    
    init() {
        self.secret = Data()
        self.digits = 6
        self.generatorAlgorithm = .timer(period: 30)
        self.hashAlgorithm = .sha512
    }
}

