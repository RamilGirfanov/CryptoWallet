//
//  LoginScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 17.03.2023.
//

import Foundation

final class LoginScreenVM: LoginVMProtocol {
    
    private let accauntManager = AccauntManager()
    
    func setupLoginData() {
        accauntManager.setupLoginData()
    }
    
    func checkData(login: String, pass: String) {
        let dataStatus: Bool = accauntManager.checkLoginData(login: login, pass: pass)
        
        if dataStatus {
            enter()
        }
    }
    
    func enter() {
        accauntManager.login()
    }
    
    func out() {}
}
