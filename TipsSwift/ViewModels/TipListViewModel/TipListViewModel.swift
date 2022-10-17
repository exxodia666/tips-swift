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
    private let imageService: ImageServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    
    init(tipsService: TipsServiceProtocol = TipsService.shared, imageService: ImageServiceProtocol = ImageService.shared) {
        self.tipsService = tipsService
        self.imageService = imageService
        
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
    
    func delete(id: String) {
        if let imageUrl = tips.first(where: { tip in tip.id == id })?.image {
            imageService.removeImage(url: imageUrl)
        }
        tipsService.deleteTip(id: id)
    }
}
