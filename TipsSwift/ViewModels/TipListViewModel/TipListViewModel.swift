//
//  TodoListViewModel.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 11.08.2022.
//

import Foundation
import Combine
import SwiftUI
import CoreData

class TipListViewModel: ObservableObject {
    
    private let tipListModel = TipListModel()
    
    @Published var tipList: [TipModel] = []
    
    init() {
        tipList = tipListModel.getTipsList()
    }
    
    func add(title: String, description: String) {
        tipListModel.add(title: title, description: description)
        tipList = tipListModel.getTipsList()
    }
    
    func delete(id: NSManagedObjectID) {
        tipListModel.delete(id: id)
        tipList = tipListModel.getTipsList()
    }
    
    func toggle(id: NSManagedObjectID) {
        tipListModel.toggle(id: id)
        tipList = tipListModel.getTipsList()
    }
}
