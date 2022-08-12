//
//  TipModel.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 31.07.2022.
//

import Foundation
import CoreData

class TipViewModelData: ObservableObject, Identifiable {
    
    let tip: TipsEntity
    
    init(tip: TipsEntity) {
        self.tip = tip
    }
    
    var id: NSManagedObjectID {
        return tip.objectID
    }
    var title: String {
        return tip.title ?? ""
    }
    
    var descriprion: String {
        return tip.descr ?? ""
    }
    var isChecked: Bool {
        return tip.isChecked
    }
}
