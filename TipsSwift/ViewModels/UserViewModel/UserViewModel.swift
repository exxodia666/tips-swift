//
//  UserViewModel.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 08.10.2022.
//
import Combine
import Foundation
import FirebaseAuth

class UserViewModel: ObservableObject {
    @Published var user: User?
    private var cancellable = Set<AnyCancellable>()
    var authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol = FirebaseAuthService.shared) {
        self.authService = authService
        
        authService.user.sink { user in
            self.user = user
        }.store(in: &cancellable)
    }
    
    func logout() {
        authService.logout()
    }
}
