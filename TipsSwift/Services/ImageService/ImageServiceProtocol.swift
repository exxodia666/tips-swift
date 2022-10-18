//
//  ImageServiceProtocol.swift
//  TipsSwift
//
//  Created by Alexey Olefir on 16.10.2022.
//
import UIKit
import Combine
import Foundation

protocol ImageServiceProtocol {
    func uploadImage(image: UIImage, completionHandler: @escaping (_ imageUrl: String) -> Void)
    func removeImage(url: String, completionHandler: @escaping () -> Void)
}
