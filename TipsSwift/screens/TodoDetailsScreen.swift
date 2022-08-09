//
//  TodoDetailsScreen.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 07.08.2022.
//

import SwiftUI

struct TodoDetailsScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HeaderGoBack(title: "Header", onGoBackPress: { self.presentationMode.wrappedValue.dismiss()
            }, iconName: "")
            VStack {
                HStack {
                    Text("Design Logo")
                        .font(.custom(Fonts.BebasNeue.rawValue, size: 26))
                        .padding(.top, 24)
                        .padding(.horizontal, 25)
                    Spacer()
                }.padding(.bottom, 25)
                HStack {
                    Text("Make Ui design for the mini project post figma link to the trello using. Make Ui design for the mini project post figma link to the trello using")
                        .font(.custom(Fonts.Montserrat.rawValue, size: 14))
                        .lineSpacing(10)
                        .foregroundColor(.dark)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 12)
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Text("Created at 1 Sept 2021")
                        .font(.custom(Fonts.Montserrat.rawValue, size: 11))
                        .foregroundColor(.dark)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 10)
                    Spacer()
                }
            }
        }
    }
}


struct TodoDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailsScreen()
    }
}
