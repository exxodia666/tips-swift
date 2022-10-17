//
//  EditTipViewModel.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 15.10.2022.
//

import Combine
import SwiftUI
import CoreData
import Foundation

class EditTipViewModel: ObservableObject {
    @Published var tip: TipModel?
    
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var deadline: Date = Date()
    @Published var image: String = ""
    
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let tipsService: TipsServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    
    init(tipsService: TipsServiceProtocol = TipsService.shared) {
        self.tipsService = tipsService
        
        tipsService.tip.sink { tip in
            self.tip = tip
        }.store(in: &cancellable)

        self.title = self.tip?.title ?? ""
        self.description = self.tip?.descriprion ?? ""
        self.deadline = self.tip?.deadline ?? Date()
        self.image = self.tip?.image ?? ""
        
        tipsService.isLoading.sink { isLoading in
            self.isLoading = isLoading
        }.store(in: &cancellable)
        
        tipsService.errorMessage.sink { errorMessage in
            self.errorMessage = errorMessage
        }.store(in: &cancellable)
    }
    
    func updateTip() {
        tipsService.updateTip(newTip: TipModel(
            id: self.tip?.id ?? "",
            title: self.title,
            descriprion: self.description,
            deadline: self.deadline,
            isDone: tip?.isDone ?? false,
            image: image
        ))
    }
}
