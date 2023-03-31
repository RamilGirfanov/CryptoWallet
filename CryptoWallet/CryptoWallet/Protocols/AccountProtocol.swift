//
//  AccountProtocol.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 31.03.2023.
//

import Foundation

protocol AccountProtocol {
    var enteredStatus: Bool { get set }
    
    var login: String? { get }
    var password: String? { get }
}
