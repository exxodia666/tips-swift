//
//  SecureFieldUI.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 05.10.2022.
//

import SwiftUI

struct SecureFieldUI: View {
    @State private var isShown: Bool = false
    @Binding var value: String
    let label: String
    let textColor: Color?
    
    init(label: String, value: Binding<String>, textColor: Color? = .white) {
        self.label = label
        self._value = value
        self.textColor = textColor
    }
    
    var body: some View {
        HStack {
            (!isShown ? AnyView(SecureField(
                "",
                text: $value
             ))
             : AnyView(TextField(
                "",
                text: $value
             )))
                .placeholder(when: value.isEmpty) {
                    Text(label)
                        .foregroundColor(.dark)
                        .font(.custom(Fonts.Montserrat.rawValue, size: 16))
                        .opacity(0.5)
                }
                .foregroundColor(textColor)
                .frame(
                    height: 48.0,
                    alignment: .center
                )
                .padding(.horizontal, 45)
            Spacer()
            Button {
                isShown.toggle()
            } label: {
                Image(systemName: isShown ? "eye" : "eye.slash")
                    .frame(width: 48, height: 48)
            }

            
        }.padding(.trailing, 25)
            .frame(height: 48)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Color.dark, lineWidth: 1)
                    .opacity(0.5)
                    .padding(.horizontal, 25)
            ).padding(.bottom, 8)
        
        
        
    }
}

struct SecureFieldUI_Previews: PreviewProvider {
    @State static var text: String = ""
    static var previews: some View {
        SecureFieldUI(
            label: "Email",
            value: $text
        )
    }
}
