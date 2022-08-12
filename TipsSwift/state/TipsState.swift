//
//  TipsState.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 03.08.2022.
//

import Foundation
import Combine

//final class TipsState: ObservableObject {
//    @Published var tipsList: [TipModel]
//
//    func addTodo(title: String, description: String) {
//        tipsList.append(
//            TipModel(
//                id: (tipsList.last?.id ?? 0) + 1,
//                title: title,
//                description: description
//            )
//        )
//    }
//
//    init() {
//        tipsList = [
//            TipModel(
//                id: 1,
//                title: "Do something",
//                description: "Lorem ipsum"
//            ),
//            TipModel(
//                id: 2,
//                title: "Do something else",
//                description: "Lorem ipsum"
//            )
//        ]
//    }
//
//    func deleteTodo(id: UInt) {
//        guard let index = tipsList.firstIndex(where: { tip in
//            tip.id == id
//        }) else {
//            return
//        }
//        tipsList.remove(at: index)
//    }
//}
