//
//  SectionView.swift
//  Helia-Task
//
//  Created by Shuhrat Nurov on 16/05/23.
//

import SwiftUI

struct SectionView: View {
    let title: String
    let btnTitle: String
    let showButton: Bool
    let btnTapped: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.appFontBold(size: 18))
            
            Spacer()
            
            if showButton {
                Button {
                    btnTapped()
                } label: {
                    Text(btnTitle)
                        .font(.appFontBold(size: 16))
                        .foregroundColor(.appGreen)
                }
                
            }

        }
        .padding(.horizontal)
    }
}
