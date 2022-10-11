//
//  HeaderGoBack.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 08.10.2022.
//
import SwiftUI

struct HeaderGoBack: View {
    let onGoBackPress: () -> Void
    
    var body: some View {
        HStack {
            Button {
                onGoBackPress()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.dark)
                    .frame(width: 20, height: 20)
            }
            Spacer()
        }
        .padding(.horizontal, 25)
        .padding(.top, 10)
    }
}

struct HeaderGoBack_Previews: PreviewProvider {
    static var previews: some View {
        HeaderGoBack(
            onGoBackPress: {}
        )
    }
}
