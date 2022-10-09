//
//  RegisterView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 17.08.2022.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Spacer()
                Image("LaunchScreenImage")
                Spacer()
                TextFieldUI(
                    label: "Email",
                    value: $viewModel.email,
                    textColor: .dark
                )
                SecureFieldUI(
                    label: "Password",
                    value: $viewModel.password,
                    textColor: .dark
                )
                SecureFieldUI(
                    label: "Confirmation",
                    value: $viewModel.confirmation,
                    textColor: .dark
                )
                ButtonUI(
                    title: "SIGN UP",
                    onPress: viewModel.signUp,
                    disabled: viewModel.disabled
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
