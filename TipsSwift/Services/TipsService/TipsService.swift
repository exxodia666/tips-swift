//
//  TipsService.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 11.10.2022.
//
import Combine
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TipsService: TipsServiceProtocol {
    
    var tips = CurrentValueSubject<[TipModel], Never>([])
    var errorMessage = PassthroughSubject<String, Never>()
    var isLoading = CurrentValueSubject<Bool, Never>(false)
    
    let authService: AuthServiceProtocol
    
    private var listener: ListenerRegistration?
    
    static var shared = TipsService()
    
    private let db = Firestore.firestore()
    
    private var cancellable = Set<AnyCancellable>()
    
    private init() {
        self.authService = FirebaseAuthService.shared
        authService.user.sink { [weak self] _ in
            guard let self = self else { return }
            self.subscribeTips()
        }.store(in: &cancellable)
    }
    
    func createTip(tip: TipModel) {
        do {
            if let uid = authService.user.value?.uid {
                try db
                    .collection("lists/\(uid)/tips")
                    .document(tip.id)
                    .setData(from: tip, merge: false)
            } else { return }
        } catch let error {
            print(error)
        }
    }
    
    func subscribeTips() {
        isLoading.value = true
        if let listener = listener {
            listener.remove()
        }
        if let uid = authService.user.value?.uid {
            self.listener = db
                .collection("lists/\(uid)/tips")
                .addSnapshotListener { querySnapshot, error in
                    guard let documents = querySnapshot?.documents else {
                        print("Error fetching documents: \(error!)")
                        return
                    }
                    self.tips.value = documents.compactMap { doc in
                        print(doc.data())
                        return try? doc.data(as: TipModel.self)
                    } //?? []
                }
            isLoading.value = false
        } else { return }
    }
    
    func getTips() {
        ///
    }
    
    func updateTip(id: String, newTip: TipModel) {
        //
    }
    
    func deleteTip(id: String) {
        ///
    }
    
    func toggleTip(id: String, isDone: Bool) {
        //
    }
    
    
    
    
}
