//
//  RegisterView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 17.08.2022.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email = ""
    @State var password = ""
    @State var confirmation = ""
    @Environment(\.presentationMode) var presentationMode
    
    var disabled: Bool {
        email.isEmpty || password.isEmpty
    }
    
    func submit() {
        print(email)
        print(password)
        print(email)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                Image("LaunchScreenImage")
                Spacer()
                TextFieldUI(
                    label: "Email",
                    value: $email,
                    textColor: .dark
                )
                SecureFieldUI(
                    label: "Password",
                    value: $password,
                    textColor: .dark
                )
                SecureFieldUI(
                    label: "Confirmation",
                    value: $confirmation,
                    textColor: .dark
                )
                ButtonUI(
                    title: "SIGN UP",
                    onPress: submit,
                    disabled: disabled
                )
                HStack {
                    Text("Have an account?")
                        .foregroundColor(.dark)
                        .font(.custom(Fonts.Montserrat.rawValue, size: 12))
                        .opacity(0.4)
                    NavigationLink {
                        SignInView()
                            .navigationBarHidden(true)
                            .navigationTitle("")
                    } label: {
                        Text("Sign in")
                            .foregroundColor(.light_peach)
                            .font(.custom(Fonts.Montserrat.rawValue, size: 12))
                    }.animation(nil)
                }
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
