//
//  TipDetailViewModel.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 14.10.2022.
//

import Combine
import SwiftUI
import CoreData
import Foundation

class TipDetailsViewModel: ObservableObject {
    @Published var tip: TipModel?
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let tipsService: TipsServiceProtocol
    private let imageService: ImageServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    
    init(tipsService: TipsServiceProtocol = TipsService.shared, imageService: ImageServiceProtocol = ImageService.shared) {
        self.tipsService = tipsService
        self.imageService = imageService
        
        tipsService.tip.sink { tip in
            self.tip = tip
        }.store(in: &cancellable)
        
        tipsService.isLoading.sink { isLoading in
            self.isLoading = isLoading
        }.store(in: &cancellable)
        
        tipsService.errorMessage.sink { errorMessage in
            self.errorMessage = errorMessage
        }.store(in: &cancellable)
    }
    
    func getTip(id: String) {
        tipsService.getTip(id: id)
    }
    func deleteTip(id: String) {
        if let imageUrl = tip?.image {
            imageService.removeImage(url: imageUrl)
        }
        tipsService.deleteTip(id: id)
    }
    
    func toggleTipState(id: String, isDone: Bool) {
        tipsService.toggleTip(id: id, isDone: isDone)
    }
}
