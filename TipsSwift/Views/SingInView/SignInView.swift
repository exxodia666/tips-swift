//
//  LoginView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 16.08.2022.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        if(viewModel.isLoading) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        } else {
            VStack {
                HeaderGoBack { presentationMode.wrappedValue.dismiss() }
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
                ButtonUI(title: "SIGN IN", onPress: viewModel.signIn, disabled: viewModel.disabled)
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
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
