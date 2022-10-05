//
//  TipModel.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 31.07.2022.
//
import Foundation
import CoreData

struct TipModel: Identifiable {
    var id: NSManagedObjectID
    var title: String
    var descriprion: String
    var isChecked: Bool
}
