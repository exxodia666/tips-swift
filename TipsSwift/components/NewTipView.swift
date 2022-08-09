//
//  TipDetailsView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 31.07.2022.
//

import SwiftUI

struct NewTipView: View {
    var onSubmit: (_ tipText: String) -> Void
    @State private var input: String = ""
    
    @FocusState private var fieldIsFocused: Bool
    
    var body: some View {
        VStack {
            TextField("Hello, World!", text: $input)
                .focused($fieldIsFocused)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
            Button {
                onSubmit(input)
            } label: {
                Text("Add")
            }
            
        }
        
        
    }
}

struct NewTipView_Previews: PreviewProvider {
    static var previews: some View {
        NewTipView { text in
            print(text)
        }
    }
}
