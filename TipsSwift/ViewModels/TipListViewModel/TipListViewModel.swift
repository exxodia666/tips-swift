//
//  TodoListViewModel.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 11.08.2022.
//

import Combine
import SwiftUI
import CoreData
import Foundation

class TipListViewModel: ObservableObject {
    @Published var tips: [TipModel] = []
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let tipsService: TipsServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    
    init(tipsService: TipsServiceProtocol = TipsService.shared) {
        self.tipsService = tipsService
        tipsService.tips.sink { tips in
            self.tips = tips
        }.store(in: &cancellable)
        
        tipsService.isLoading.sink { isLoading in
            self.isLoading = isLoading
        }.store(in: &cancellable)
        
        tipsService.errorMessage.sink { errorMessage in
            self.errorMessage = errorMessage
        }.store(in: &cancellable)
    }
}
