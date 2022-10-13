//
//  Form.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 07.08.2022.
//

import SwiftUI

struct Form: View {
    @StateObject private var createTipViewModel: CreateTipViewModel = CreateTipViewModel()
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
                text: $createTipViewModel.title
            )
                .placeholder(when: createTipViewModel.title.isEmpty) {
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
                    text: $createTipViewModel.description
                )
                    .padding(.top, 5)
                VStack {
                    HStack {
                        Text(createTipViewModel.description.isEmpty ? "Description" : "")
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
            TextField(
                "",
                text: $createTipViewModel.image
            )
                .placeholder(when: createTipViewModel.image.isEmpty) {
                    Text("Add Image (Optional)")
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
            //            TextField(
            //                "",
            //                text: $createTipViewModel.deadline
            //            )
            //                .placeholder(when: createTipViewModel.deadline.isEmpty) {
            //                    Text("Deadline (Optional)")
            //                        .foregroundColor(.white)
            //                        .font(.custom(Fonts.Montserrat.rawValue, size: 16))
            //                }
            //                .foregroundColor(.white)
            //                .frame(
            //                    height: 48.0,
            //                    alignment: .center
            //                )
            //                .padding(.horizontal, 45)
            //                .overlay(
            //                    RoundedRectangle(cornerRadius: 15)
            //                        .strokeBorder(.white, lineWidth: 2)
            //                        .padding(.horizontal, 25)
            //                )
            Button(action: {
                createTipViewModel.createTip()
                showSheet()
            }, label: {
                Spacer()
                Text("ADD TODO")
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

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        Form(showSheet: {})
    }
}
