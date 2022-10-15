//
//  TipModel.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 31.07.2022.
//
import Foundation
import CoreData

struct TipModel: Identifiable, Encodable, Decodable {
    var id: String
    var title: String
    var descriprion: String
    var deadline: Date
    var isDone: Bool
    var image: String
}
