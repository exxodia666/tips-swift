//
//  TopView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 09.08.2022.
//

import SwiftUI

struct TopView: View {
    var onFilterPress: () -> Void
    
    var body: some View {
        HStack {
            Image(Images.list.rawValue)
                .frame(width: 25, height: 25, alignment: .center)
            Text("LIST OF TODO")
                .padding(.leading, 10)
                .font(.custom(Fonts.BebasNeue.rawValue, size: 36.0))
                .foregroundColor(.peach)
            Spacer()
//            Button(action: onFilterPress) {
//                Image(Images.filter.rawValue)
//                    .frame(width: 25, height: 25, alignment: .center)
//            }
        }.padding(.horizontal, 25)
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(onFilterPress: {})
    }
}
