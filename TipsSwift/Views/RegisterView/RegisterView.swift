//
//  RegisterView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 17.08.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email = ""
    @State var password = ""
    @State var confirmation = ""
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
                    value: $email
                )
                SecureFieldUI(
                    value: $password,
                    label: "Password"
                )
                SecureFieldUI(
                    value: $confirmation,
                    label: "Confirmation"
                    
                )
                ButtonUI(title: "SIGN UP") {
                    
                }
                HStack {
                    Text("Have an account?")
                        .foregroundColor(.dark)
                        .font(.custom(Fonts.Montserrat.rawValue, size: 12))
                        .opacity(0.4)
                    NavigationLink {
                        LoginView()
                            .navigationBarHidden(true)
                            .navigationTitle("")
                    } label: {
                        Text("Log in")
                            .foregroundColor(.light_peach)
                            .font(.custom(Fonts.Montserrat.rawValue, size: 12))
                    }.animation(nil)
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
