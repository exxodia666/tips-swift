//
//  TodoDetailsScreen.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 07.08.2022.
//

import SwiftUI
import CoreData

struct TipDetailsScreen: View {
    let id: String
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = TipDetailsViewModel()
    @State private var isSheetShown: Bool = false
    
    func showSheet() {
        isSheetShown = false
    }
    
    var body: some View {
        VStack {
            HeaderGoBackWithButtons(
                title: "Header",
                iconName: "") {
                    self.presentationMode.wrappedValue.dismiss()
                } onEditPress: {
                   isSheetShown = true
                } onDeletePress: {
                    viewModel.deleteTip(id: id)
                    self.presentationMode.wrappedValue.dismiss()
                }
            VStack {
                HStack {
                    Button {
                        viewModel.toggleTipState(
                            id: id,
                            isDone: viewModel.tip?.isDone ?? false
                        )
                    } label: {
                        Text(viewModel.tip?.title ?? "No title")
                            .strikethrough(viewModel.tip?.isDone ?? false)
                            .font(.custom(Fonts.BebasNeue.rawValue, size: 26))
                            .foregroundColor(.dark)
                            .padding(.top, 24)
                            .padding(.horizontal, 25)
                    }

                    
                    Spacer()
                }.padding(.bottom, 24)
                
                HStack {
                    Text(viewModel.tip?.descriprion ?? "No description ")
                        .strikethrough(viewModel.tip?.isDone ?? false)
                        .font(.custom(Fonts.Montserrat.rawValue, size: 14))
                        .lineSpacing(10)
                        .foregroundColor(.dark)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 12)
                    Spacer()
                }.padding(.bottom, 25)
//                ImageView(withURL: viewModel.tip?.image ?? "")
                Spacer()
                HStack {
                    Spacer()
                    Text("Created at " + (viewModel.tip?.deadline.formatted() ?? "No date"))
                        .font(.custom(Fonts.Montserrat.rawValue, size: 11))
                        .foregroundColor(.dark)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 10)
                    Spacer()
                }
            }
        }.onAppear {
            viewModel.getTip(id: id)
        }.sheet(isPresented: $isSheetShown) {
            EditTipView(showSheet: showSheet)
        }
    }
}


struct TodoDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TipDetailsScreen(id: "dasfas-asfasfa-fsafa-fasfas")
    }
}
