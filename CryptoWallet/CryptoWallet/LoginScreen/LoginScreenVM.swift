//
//  LoginScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 17.03.2023.
//

import Foundation

final class LoginScreenVM: LoginVMProtocol {
    func checkData(login: String, pass: String) {
        let dataStatus: Bool = AccauntManager.shared.checkLoginData(login: login, pass: pass)
        
        if dataStatus {
            enter()
        }
    }
    
    func enter() {
        AccauntManager.shared.login()
    }
}
