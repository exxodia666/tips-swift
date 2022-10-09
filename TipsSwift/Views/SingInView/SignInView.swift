//
//  LoginView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 16.08.2022.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @Environment(\.presentationMode) var presentationMode
    
    func submit() {
        print(email)
        print(password)
    }
    var body: some View {
        VStack {
            HeaderGoBack { presentationMode.wrappedValue.dismiss() }
            Spacer()
            Spacer()
            Image("LaunchScreenImage")
            Spacer()
            TextFieldUI(
                label: "Email",
                value: $email
            )
            SecureFieldUI(
                label: "Password",
                value: $password
            )
            ButtonUI(title: "SIGN IN", onPress: submit, disabled: true)
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.dark)
                    .font(.custom(Fonts.Montserrat.rawValue, size: 12))
                    .opacity(0.4)
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Sign up")
                        .foregroundColor(.light_peach)
                        .font(.custom(Fonts.Montserrat.rawValue, size: 12))
                }
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
