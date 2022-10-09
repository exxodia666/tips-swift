//
//  ProfileView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 10.10.2022.
//

import Foundation
import SwiftUI
import Combine

struct ProfileView: View {
    @StateObject private var viewModel = UserViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HeaderGoBack {
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                    Text(viewModel.user?.email ?? "")
                    ButtonUI(title: "Log Out", onPress: {
                        viewModel.logout()
                    }, disabled: false)
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
        }
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
