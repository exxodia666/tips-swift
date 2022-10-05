//
//  LoginView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 16.08.2022.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var confirmation = ""

    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Image("LaunchScreenImage")
            Spacer()
            TextFieldUI(
                label: "Email",
                value: $email
            )
            SecureFieldUI(
                value: $password,
                label: "Password"
            )
            ButtonUI(title: "SIGN UP") {
                
            }
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.dark)
                    .font(.custom(Fonts.Montserrat.rawValue, size: 12))
                    .opacity(0.4)
                Button {
                    
                } label: {
                    Text("Sign up")
                        .foregroundColor(.light_peach)
                        .font(.custom(Fonts.Montserrat.rawValue, size: 12))
                }
                
                
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
