//
//  CardModel.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 10/26/21.
//

import Foundation
import THOTP

struct Card: Identifiable {
    let id = UUID()
    var title: String
    var password: Password? = nil
    
    init(title: String, urlStr: String) {
        self.title = title
        
        do {
            if let url = URL(string: urlStr) {
                self.password = try Password(url: url)
            }
            else {
                self.password = try Password(name: "Test", issuer: nil, image: nil, generator: Generator(type: .counter(11), hash: .sha512, secret: Data(), digits: 11))
            }
        }
        catch {
            print("Error occurred in Card initializer")
        }
    }
}
