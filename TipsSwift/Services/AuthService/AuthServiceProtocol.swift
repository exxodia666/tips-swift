//
//  AuthServiceProtocol.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 07.10.2022.
//
import Combine
import Foundation
import FirebaseAuth

protocol AuthServiceProtocol {
    var user: CurrentValueSubject<User?, Never> {get}
    var errorMessage: PassthroughSubject<String, Never> {get}
    
    func signUp(email: String, password: String)
    func signIn(email: String, password: String)
    func changeEmail(email: String)
    func deleteAccount()
    func logout()
}
