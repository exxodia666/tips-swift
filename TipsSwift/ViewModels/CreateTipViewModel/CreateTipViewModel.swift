//
//  CreateTipViewModel.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 12.10.2022.
//

import Combine
import Foundation
import FirebaseAuth

class CreateTipViewModel: ObservableObject {
    
    private let tipsService: TipsServiceProtocol
    
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var deadline: Date = Date()
    @Published var image: String = ""
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    private var cancellable = Set<AnyCancellable>()
    
    init(tipsService: TipsServiceProtocol = TipsService.shared) {
        self.tipsService = tipsService
        
        tipsService.errorMessage.sink { errMsg in
            self.errorMessage = errMsg
        }.store(in: &cancellable)
        
        tipsService.isLoading.sink { isLoading in
            self.isLoading = isLoading
        }.store(in: &cancellable)
    }
    
    func createTip() {
        tipsService.createTip(
            tip: TipModel(
                id: UUID().uuidString,
                title: title,
                descriprion: description,
                deadline: deadline,
                isDone: false,
                image: image
            )
        )
    }
}

