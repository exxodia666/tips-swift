//
//  EditTipView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 17.10.2022.
//

import SwiftUI

struct EditTipView: View {
    @StateObject private var viewModel: EditTipViewModel = EditTipViewModel()
    
    let showSheet: () -> Void
    init(showSheet: @escaping () -> Void) {
        UITextView.appearance().backgroundColor = .clear
        self.showSheet = showSheet
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }
            RoundedRectangle(cornerRadius: 3)
                .foregroundColor(.white)
                .frame(
                    width: 80,
                    height: 6,
                    alignment: .center
                )
                .padding(.top, 16)
                .padding(.bottom, 16)
            TextField(
                "",
                text: $viewModel.title
            )
                .placeholder(when: viewModel.title.isEmpty) {
                    Text("Title")
                        .foregroundColor(.white)
                        .font(.custom(Fonts.Montserrat.rawValue, size: 16))
                }
                .foregroundColor(.white)
                .frame(
                    height: 48.0,
                    alignment: .center
                )
                .padding(.horizontal, 45)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .strokeBorder(.white, lineWidth: 2)
                        .padding(.horizontal, 25)
                )
            ZStack {
                TextEditor(
                    text: $viewModel.description
                )
                    .padding(.top, 5)
                VStack {
                    HStack {
                        Text(viewModel.description.isEmpty ? "Description" : "")
                            .foregroundColor(.white)
                            .font(.custom(Fonts.Montserrat.rawValue, size: 16))
                            .padding(.top, 15)
                        Spacer()
                    }
                    Spacer()
                }
                
            }
            .background(Color.light_peach)
            .foregroundColor(.white)
            .frame(
                alignment: .center
            )
            .padding(.horizontal, 45)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(.white, lineWidth: 2)
                    .padding(.horizontal, 25)
            )
            ImageView(withURL: viewModel.image)
            Button(action: {
                viewModel.updateTip()
                showSheet()
            }, label: {
                Spacer()
                Text("UPDATE TODO")
                    .foregroundColor(.peach)
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
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 3)
                .foregroundColor(.light_peach)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct EditTipView_Previews: PreviewProvider {
    static var previews: some View {
        EditTipView(showSheet: {})
    }
}
