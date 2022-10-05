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
    
    var body: some View {
        Button(action: onPress) {
            Spacer()
            Text(title.uppercased())
                .padding(.vertical, 16)
                .foregroundColor(.white)
                .font(.custom(Fonts.Montserrat.rawValue, size: 14))
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 12.0)
                .foregroundColor(.light_peach)
        ).padding(.horizontal, 24)
            .padding(.top, 12)
    }
}

struct ButtonUI_Previews: PreviewProvider {
    static var previews: some View {
        ButtonUI(title: "BUTTON", onPress: { })
    }
}
