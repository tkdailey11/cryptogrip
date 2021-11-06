//
//  BorderedButton.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 11/5/21.
//

import Foundation
import SwiftUI

struct BorderedButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        
        return configuration.label
            .padding()
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor)
            .cornerRadius(9)
            .overlay(
                RoundedRectangle(cornerRadius: 9)
                    .stroke(currentForegroundColor, lineWidth: 1)
            )
            .padding([.top, .bottom], 10)
    }
}
