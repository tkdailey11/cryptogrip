//
//  Securable.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 11/6/21.
//

import Foundation
import THOTP

protocol Securable {
    var title: String { get set }
    var passcode: Password { get }
    var currentCode: String { get }
    mutating func passwordFromURLString(urlStr: String)
}

internal protocol MutatingSecurable: Securable {
    var passcode: Password { get set }
}

extension MutatingSecurable {
    mutating func passwordFromURLString(urlStr: String) {
        self.passcode = Password.initWithURLString(urlStr)
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
