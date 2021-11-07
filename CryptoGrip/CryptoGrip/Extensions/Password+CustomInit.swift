//
//  Password+CustomInit.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 11/6/21.
//

import Foundation
import THOTP

extension Password {
    static func initWithURLString(_ urlString: String) -> Password {
        var result = Password(name: "", generator: TestGenerator())
        do {
            if let url = URL(string: urlString) {
                result = try Password(url: url)
            }
        }
        catch { }
        
        return result
    }
}

fileprivate class TestGenerator: GeneratorProtocol {
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
