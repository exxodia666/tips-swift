//
//  HeaderGoBack.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 07.08.2022.
//

import SwiftUI

struct HeaderGoBackWithButtons: View {
    let title: String
    let iconName: String
    let onGoBackPress: () -> Void
    let onEditPress: () -> Void
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
                onEditPress()
            } label: {
                Image(systemName: "pencil")
                    .foregroundColor(.dark)
                    .font(.system(size: 25))
            }
            Button {
                onDeletePress()
            } label: {
                Image(Images.trash.rawValue)
                    .foregroundColor(.dark)
                    .font(.system(size: 25))
            }
        }.padding(.horizontal, 25)
    }
}

struct HeaderGoBackWithButtons_Previews: PreviewProvider {
    static var previews: some View {
        HeaderGoBackWithButtons(
            title: "Header",
            iconName: "",
            onGoBackPress: {},
            onEditPress: {},
            onDeletePress: {}
        )
    }
}
