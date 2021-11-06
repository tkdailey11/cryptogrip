//
//  GridView.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 11/5/21.
//

import SwiftUI
import THOTP

struct GridView: View {
    var columns: [GridItem] = [
        GridItem(.flexible())
    ]
    var cards: [Card] = [
        Card(title: "Account 1", urlStr: ""),
        Card(title: "Account 2", urlStr: ""),
        Card(title: "Account 3", urlStr: ""),
        Card(title: "Account 4", urlStr: ""),
        Card(title: "Account 5", urlStr: ""),
        Card(title: "Account 6", urlStr: "")
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(cards) { card in
//                    PassView(title: card.title, passcode: card.password?.currentPassword ?? "000000")
//                        .frame(height: 150)
                }
            }
            .padding()
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
