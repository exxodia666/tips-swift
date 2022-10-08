//
//  ContentView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 08.10.2022.
//

import SwiftUI
import Combine
import Foundation

struct ContenView: View {
    @StateObject var viewModel = UserViewModel()
    var body: some View {
        if viewModel.user != nil {
            TipListView()
        } else {
            RegisterView()
        }
    }
}
struct ContenView_Previews: PreviewProvider {
    static var previews: some View {
        ContenView()
    }
}
