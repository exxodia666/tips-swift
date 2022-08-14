//
//  HeaderGoBack.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 07.08.2022.
//

import SwiftUI

struct HeaderGoBack: View {
    let title: String
    let iconName: String
    let onGoBackPress: () -> Void
    let onTogglePress: () -> Void
    let onDeletePress: () -> Void

    
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
            Button {
                onTogglePress()
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.dark)
                    .font(.system(size: 25))
            }
            Button {
                onGoBackPress()
            } label: {
                Image(Images.trash.rawValue)
                    .foregroundColor(.dark)
                    .font(.system(size: 25))
            }
        }.padding(.horizontal, 25)
    }
}

struct HeaderGoBack_Previews: PreviewProvider {
    static var previews: some View {
        HeaderGoBack(
            title: "Header",
            iconName: "",
            onGoBackPress: {},
            onTogglePress: {},
            onDeletePress: {}
        )
    }
}
