//
//  AuthService.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 07.10.2022.
//
import Combine
import Foundation
import FirebaseAuth

class FirebaseAuthService: AuthServiceProtocol {
    var user = CurrentValueSubject<User?, Never>(nil)
    var errorMessage = PassthroughSubject<String, Never>()
    
    static let shared = FirebaseAuthService()
    
    var isLoading = CurrentValueSubject<Bool, Never>(false)
    
    private init() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let strongSelf = self else { return }
            strongSelf.user.value = user
        }
    }
    func signIn(email: String, password: String) {
        self.isLoading.value = true
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            strongSelf.isLoading.value = false
            // ...
        }
    }
    func signUp(email: String, password: String) {
        self.isLoading.value = true
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            strongSelf.isLoading.value = false
            // ...
        }
    }
    func changeEmail(email: String) {
        //"Not implemented yet"
    }
    func deleteAccount() {
        // "Not implemented yet"
    }
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
