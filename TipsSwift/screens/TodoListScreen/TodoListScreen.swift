//
//  ContentView.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 30.07.2022.
//

import SwiftUI

struct TodoListScreen: View {
    @EnvironmentObject var tipState: TipsState
    @State private var showSheet = false
    
    func onFilterPress() {
        fatalError("not implemented yet")
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Header(
                        title: "TODOLIST",
                        onRightPress: {
                            
                        },
                        iconName: "gearshape"
                    )
                    ScrollView {
                        TopView(onFilterPress: onFilterPress)
                        ForEach($tipState.tipsList) { $tip in
                            NavigationLink {
                                TodoDetailsScreen().navigationBarBackButtonHidden(true)
                                    .navigationBarHidden(true)
                                    .navigationBarTitle("")
                            } label: {
                                Tip(tip: $tip, onRemove: { id in
                                    tipState.deleteTodo(id: id)
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
        }
    }
}
struct TodoListScreen_Previews: PreviewProvider {
    static var previews: some View {
        TodoListScreen().environmentObject(TipsState())
    }
}
