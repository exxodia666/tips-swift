//
//  SignInViewModel.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 10.10.2022.
//

import Combine
import Foundation
import FirebaseAuth

class SignInViewModel: ObservableObject {
    let authService: AuthServiceProtocol
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isLoading: Bool = false
    
    var disabled: Bool {
        email.isEmpty || password.isEmpty
    }
    
    @Published var user: User?
    @Published var errorMessage: String = ""
    
    private var cancellable = Set<AnyCancellable>()
    
    init(authService: AuthServiceProtocol = FirebaseAuthService.shared) {
        self.authService = authService
        
        authService.user.sink { user in
            self.user = user
        }.store(in: &cancellable)
        
        authService.errorMessage.sink { errMsg in
            self.errorMessage = errMsg
        }.store(in: &cancellable)
        
        authService.isLoading.sink { isLoading in
            self.isLoading = isLoading
        }.store(in: &cancellable)
    }
    
    func signIn() {
        authService.signIn(email: email, password: password)
    }
    
    func validate() -> Bool {return true}
}

