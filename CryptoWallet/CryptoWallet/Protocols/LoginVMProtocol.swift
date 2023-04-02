//
//  LoginVMProtocol.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 17.03.2023.
//

import Foundation

protocol LoginVMProtocol {
    func enter(login: String, pass: String) -> Bool
    
    func out()
}
