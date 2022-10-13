//
//  ContentView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 30.07.2022.
//

import SwiftUI
import Combine

struct TipListView: View {
    @StateObject private var viewModel = TipListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Header(
                        title: "TODOLIST",
                        onRightPress: {},
                        iconName: "gearshape"
                    )
                    if(viewModel.isLoading) {
                        ProgressView().progressViewStyle(CircularProgressViewStyle())
                    } else {
                        ScrollView {
                            TopView(onFilterPress: {})
                            ForEach(viewModel.tips) { tip in
                                NavigationLink {
                                    TipDetailsScreen(id: tip.id)
                                        .navigationBarBackButtonHidden(true)
                                        .navigationBarHidden(true)
                                        .navigationBarTitle("")
                                } label: {
                                    TipComponent(tip: tip, onRemove: {
                                        viewModel.delete(id: tip.id)
                                    })
                                }.animation(nil)
                            }
                        }
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        FloatingButton()
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
        }
    }
}

struct TipListView_Previews: PreviewProvider {
    static var previews: some View {
        TipListView()
    }
}
