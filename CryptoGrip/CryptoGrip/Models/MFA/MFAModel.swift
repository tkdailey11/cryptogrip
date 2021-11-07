//
//  PassModel.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 11/5/21.
//

import Foundation
import THOTP

struct MFAModel: MutatingSecurable, Identifiable {
    var id: UUID = UUID()
    var title: String
    var currentCode: String
    var passcode: Password
}
