//
//  TodoDetailsScreen.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 07.08.2022.
//

import SwiftUI

struct TodoDetailsScreen: View {
    @Environment(\.presentationMode) var presentationMode
    let tip: TipViewModelData
    let toggle: () -> Void
    
    var body: some View {
        VStack {
            HeaderGoBack(
                title: "Header",
                onGoBackPress: { self.presentationMode.wrappedValue.dismiss()},
                onTogglePress: toggle,
                iconName: ""
            )
            VStack {
                HStack {
                    Text(tip.title)
                        .strikethrough(tip.isChecked)
                        .font(.custom(Fonts.BebasNeue.rawValue, size: 26))
                        .padding(.top, 24)
                        .padding(.horizontal, 25)
                    Spacer()
                }.padding(.bottom, 25)
                HStack {
                    Text(tip.descriprion)
                        .strikethrough(tip.isChecked)
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
    @ObservedObject static var tipListViewModel = TipListViewModel()
    static var previews: some View {
        TodoDetailsScreen(tip: tipListViewModel.tipList.first!, toggle: {})
    }
}
