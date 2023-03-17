//
//  LoginVMProtocol.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 17.03.2023.
//

import Foundation

protocol LoginVMProtocol {
    func setupLoginData()
    func checkData(login: String, pass: String)
    func enter()
    func out()
}
