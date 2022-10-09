//
//  ButtonUI.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 17.08.2022.
//

import SwiftUI

struct ButtonUI: View {
    let title: String
    let onPress: () -> Void
    let disabled: Bool
    
    var body: some View {
        Button(action: onPress) {
            Spacer()
            Text(title.uppercased())
                .padding(.vertical, 16)
                .foregroundColor(disabled ? .dark : .white)
                .font(.custom(Fonts.Montserrat.rawValue, size: 14))
            Spacer()
        }
        .disabled(disabled)
        .background(
            RoundedRectangle(cornerRadius: 12.0)
                .foregroundColor(disabled ? .light : .light_peach)
        )
        .overlay(RoundedRectangle(cornerRadius: 12.0)
                    .strokeBorder(disabled ? Color.light_peach : .light_peach, lineWidth: 1)
        )
        .padding(.horizontal, 24)
    }
}

struct ButtonUI_Previews: PreviewProvider {
    static var previews: some View {
        ButtonUI(title: "BUTTON", onPress: { }, disabled: false)
    }
}
