//
//  FloatingButton.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 09.08.2022.
//

import SwiftUI

struct FloatingButton: View {
    @State private var isSheetShown: Bool = false
    
    func showSheet() {
        isSheetShown.toggle()
    }
    
    var body: some View {
        Button {
            isSheetShown.toggle()
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 24))
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
        }
        .background(Color.peach)
        .cornerRadius(25)
        .padding()
        .shadow(color: Color.black.opacity(0.3),
                radius: 3,
                x: 3,
                y: 3)
        .sheet(isPresented: $isSheetShown) {
            Form(showSheet: showSheet)
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    @State static private var isShown = false
    static var previews: some View {
        FloatingButton()
    }
}
