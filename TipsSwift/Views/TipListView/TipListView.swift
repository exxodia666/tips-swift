//
//  ContentView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 30.07.2022.
//

import SwiftUI
import Combine

struct TipListView: View {
    
    @State private var showSheet = false
    @ObservedObject var tipListViewModel = TipListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Header(
                        title: "TODOLIST",
                        onRightPress: {},
                        iconName: "gearshape"
                    )
                    ScrollView {
                        TopView(onFilterPress: {})
                        ForEach(tipListViewModel.tipList) { tip in
                            NavigationLink {
                                TipDetailsScreen(id: tip.id)
                                    .navigationBarBackButtonHidden(true)
                                    .navigationBarHidden(true)
                                    .navigationBarTitle("")
                            } label: {
                                TipComponent(tip: tip, onRemove: {
                                    tipListViewModel.delete(id: tip.id)
                                })
                            }.animation(nil)
                        }
                    }
                    
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        FloatingButton(showSheet: $showSheet)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
        }.environmentObject(tipListViewModel)
    }
}
struct TipListView_Previews: PreviewProvider {
    static var previews: some View {
        TipListView()
    }
}
