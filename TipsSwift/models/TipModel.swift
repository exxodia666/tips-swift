//
//  TipModel.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 31.07.2022.
//

import Foundation


struct TipModel : Identifiable {
    var id: UInt
    private(set) var title: String
    private(set) var description: String
    var isChecked: Bool
    
    init(id: UInt, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
        self.isChecked = false
    }
    
    mutating func toggleIsChecked() {
        isChecked.toggle()
    }
    
    mutating func editTitle(newTitle: String) {
        self.title = newTitle
    }
    
    mutating func editDescription(newDescription: String) {
        self.description = newDescription
    }
}
