//
//  TodoDetailsScreen.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 07.08.2022.
//

import SwiftUI
import CoreData
struct TipDetailsScreen: View {
    let id: String
    @Environment(\.presentationMode) var presentationMode

    
//    var tip: TipModel {
//        return tipsViewModel.tipList.first { $0.id == self.id}!
//    }
//
//    func toggle() {
//        tipsViewModel.toggle(id: self.id)
//    }
//
//    func delete() {
//        tipsViewModel.delete(id: self.id)
//    }
    
    var body: some View {
        VStack {
//            HeaderGoBackWithButtons(
//                title: "Header",
//                iconName: "") {
//                    self.presentationMode.wrappedValue.dismiss()
//                } onTogglePress: {
//                    toggle()
//                } onDeletePress: {
//                    delete()
//                }
//            VStack {
//                HStack {
//                    Text(tip.title)
//                        .strikethrough(tip.isDone)
//                        .font(.custom(Fonts.BebasNeue.rawValue, size: 26))
//                        .padding(.top, 24)
//                        .padding(.horizontal, 25)
//                    Spacer()
//                }.padding(.bottom, 25)
//                HStack {
//                    Text(tip.descriprion)
//                        .strikethrough(tip.isDone)
//                        .font(.custom(Fonts.Montserrat.rawValue, size: 14))
//                        .lineSpacing(10)
//                        .foregroundColor(.dark)
//                        .padding(.horizontal, 25)
//                        .padding(.bottom, 12)
//                    Spacer()
//                }
//                Spacer()
//                HStack {
//                    Spacer()
//                    Text("Created at 1 Sept 2021")
//                        .font(.custom(Fonts.Montserrat.rawValue, size: 11))
//                        .foregroundColor(.dark)
//                        .padding(.horizontal, 16)
//                        .padding(.bottom, 10)
//                    Spacer()
//                }
//            }
        }
    }
}


struct TodoDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TipDetailsScreen()
    }
}
