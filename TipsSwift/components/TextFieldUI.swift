//
//  TextFieldUI.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 17.08.2022.
//

import SwiftUI

struct TextFieldUI: View {
    let label: String
    @Binding var value: String
    let textColor: Color?
    
    init(label: String, value: Binding<String>, textColor: Color? = .white) {
        self.label = label
        self._value = value
        self.textColor = textColor
    }
    
    func clearField(){
        value = ""
    }
    
    var body: some View {
        HStack {
            TextField(
                "",
                text: $value
            )
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
                if !value.isEmpty{
                    clearField()
                }
            } label: {
                Image(systemName: "xmark")
                    .accentColor(Color.red)
                    .opacity(!value.isEmpty ? 1 : 0 )
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

struct TextFieldUI_Previews: PreviewProvider {
    @State static var text: String = ""
    static var previews: some View {
        TextFieldUI(
            label: "Email",
            value: $text
        )
    }
}
