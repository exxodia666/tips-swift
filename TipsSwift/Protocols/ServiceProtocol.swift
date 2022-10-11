//
//  ServiceProtocol.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 11.10.2022.
//
import Combine
import Foundation

protocol ServiceProtocol {
    var errorMessage: PassthroughSubject<String, Never> {get}
    var isLoading: CurrentValueSubject<Bool, Never> {get}
}
