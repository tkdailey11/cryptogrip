//
//  GridView.swift
//  CryptoGrip
//
//  Created by Tyler Dailey on 11/5/21.
//

import SwiftUI
import THOTP

struct GridView: View {
    
    @ObservedObject var viewModel: MFAViewModel
    
    var columns: [GridItem] = [
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.passcodes) { passcode in
                    MFAView(viewModel: passcode)
                        .frame(height: 150)
                }
            }
            .padding()
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var vm = MFAViewModel()
    
    static var previews: some View {
        vm.initWithTestData()
        return GridView(viewModel: vm)
    }
}
