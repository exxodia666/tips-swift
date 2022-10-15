//
//  Tip.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 31.07.2022.
//

import SwiftUI

struct TipComponent: View {
    var tip: TipModel
    var onRemove: () -> Void
    @State var dragAmount: CGSize = .zero
    
    var body: some View {
        Spacer()
        ZStack {
            HStack {
                Spacer()
                VStack{
                    Button(action: {
                        onRemove()
                    }) {
                        Image(Images.trash.rawValue)
                    }
                }.frame(width: 100, height: 112 )
            }.padding(.horizontal, 25)
                .padding(.bottom, 20)
            VStack {
                HStack {
                    Text(tip.title )
                        .strikethrough(tip.isDone)
                        .padding(.horizontal, 16)
                        .font(.custom(Fonts.MontserratMedium.rawValue, size: 16))
                        .foregroundColor(.white)
                    Spacer()
                    Image(Images.clock.rawValue)
                        .padding(.horizontal, 10)
                }
                .padding(.top, 15)
                .padding(.bottom, 12)
                Text(tip.descriprion )
                    .strikethrough(tip.isDone)
                    .font(.custom(Fonts.Montserrat.rawValue, size: 14)).lineSpacing(10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(2)
                    .padding(.bottom, 12)
                
                Text("Created at 1 Sept 2021")
                    .font(.custom(Fonts.Montserrat.rawValue, size: 11))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                
            }.background(
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.peach)
            )
                .padding(.horizontal, 25)
                .padding(.bottom, 20)
                .offset(x: dragAmount.width)
                .gesture(DragGesture()
                            .onChanged({ g in
                    if g.translation.width < 0 {
                        dragAmount = g.translation
                    } else {
                        dragAmount = CGSize.zero
                    }
                })
                            .onEnded({ g in
                    if dragAmount.width > -120 {
                        dragAmount = CGSize.zero
                    } else {
                        dragAmount.width = -100
                    }
                }))
        }
    }
}

struct Tip_Previews: PreviewProvider {
    static var previews: some View {
        TipComponent(
            tip: TipModel(
                id: "fasfsafasfasf",
                title: "fasfsafaff",
                descriprion: "fasfsafaff",
                deadline: Date(),
                isDone: false,
                image: ""
            )
        ) {}
    }
}
