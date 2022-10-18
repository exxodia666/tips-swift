//
//  Header.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 06.08.2022.
//

import SwiftUI

struct Header: View {
    let title: String
    let onRightPress: () -> Void
    let iconName: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.light_peach)
                .font(.custom(Fonts.BebasNeue.rawValue, size: 25.0))
            Spacer()
            NavigationLink {
                ProfileView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
                    .navigationBarTitle("")
            } label: {
                Image(systemName: iconName)
                    .foregroundColor(.dark)
                    .font(.system(size: 25))
            }
        }
        .padding(.horizontal, 25)
        .padding(.top, 10)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: "TODOLIST", onRightPress: {}, iconName: "gearshape")
    }
}
