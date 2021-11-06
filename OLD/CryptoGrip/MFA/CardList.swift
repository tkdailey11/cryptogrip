//
//  CardList.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 10/27/21.
//

import Foundation

class CardList: ObservableObject {
    var cards: [Card] = []
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { timer in
            
        }
    }
}
