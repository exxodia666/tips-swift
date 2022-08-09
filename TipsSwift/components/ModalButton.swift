//
//  ModalButton.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 08.08.2022.
//

import SwiftUI

struct ModalButton: View {
    var body: some View {
        HStack{
            Button(action: {
                
            }, label: {
                Spacer()
                Text("ADD TODO")
                    .foregroundColor(.green)
                    .font(.custom(Fonts.MontserratMedium.rawValue, size: 16))
                Spacer()
            })
            
                .frame(
                    height: 48.0,
                    alignment: .center
                )
                .padding(.horizontal, 45)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.white)
                ).padding(.horizontal, 25)
        }
    }
}
    
    struct ModalButton_Previews: PreviewProvider {
        static var previews: some View {
            ModalButton()
        }
    }
