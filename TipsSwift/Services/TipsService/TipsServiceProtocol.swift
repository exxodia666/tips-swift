//
//  TipsServiceProtocol.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 11.10.2022.
//
import Combine
import Foundation

protocol TipsServiceProtocol: ServiceProtocol {
    var tips: CurrentValueSubject<[TipModel], Never> {get}
    
    func createTip(tip: TipModel)
    func subscribeTips()
    func getTips()
    func updateTip(newTip: TipModel)
    func deleteTip(id: String)
    func toggleTip(id: String, isDone: Bool)
}
