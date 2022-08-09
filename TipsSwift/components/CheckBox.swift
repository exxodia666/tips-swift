//
//  CheckBox.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 31.07.2022.
//

import SwiftUI

struct CheckBox: View {
    @Binding var checked: Bool
    var onPress: () -> Void
    @EnvironmentObject var tipState: TipsState
    
    
    
    var body: some View {
        Button {
            withAnimation {
                onPress()
            }
        } label: {
            Image(systemName: "checkmark")
                .opacity(checked ? 1 : 0)
                .foregroundColor(.blue)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.blue, lineWidth: 1)
                        .frame(width: 20, height: 20)
                )
        }
    }
}

struct CheckBox_Previews: PreviewProvider {
    @State static var checked: Bool = true
    static var previews: some View {
        CheckBox(checked: $checked) {
            print($checked)
        }
    }
}
