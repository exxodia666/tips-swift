//
//  Tip.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 31.07.2022.
//

import SwiftUI

struct Tip: View {
    @Binding var tip: TipModel
    var onRemove: (_ id: UInt) -> Void
    @State var dragAmount: CGSize = .zero
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                VStack{
                    Button(action: {
                        onRemove(tip.id)
                    }) {
                        Image(Images.trash.rawValue)
                    }
                }.frame(width: 100, height: 112 )
            }.padding(.horizontal, 25)
                .padding(.bottom, 20)
            VStack {
                HStack {
                    Text(tip.title)
                        .padding(.horizontal, 16)
                        .font(.custom(Fonts.MontserratMedium.rawValue, size: 16))
                        .foregroundColor(.white)
                    Spacer()
                    Image(Images.clock.rawValue)
                        .padding(.horizontal, 10)
                }
                .padding(.top, 15)
                .padding(.bottom, 12)
                Text(tip.description)
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
    
    @State static var tip: TipModel = TipModel(
        id: 1,
        title: "Buy me a coffe",
        description: "Lorem ipsum description"
        
    )
    
    static var previews: some View {
        Tip(tip: $tip, onRemove: { id in })
    }
}
