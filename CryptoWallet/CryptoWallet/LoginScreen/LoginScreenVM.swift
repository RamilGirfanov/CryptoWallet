//
//  LoginScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 17.03.2023.
//

import UIKit

final class LoginScreenVM: LoginVMProtocol {
    
    // MARK: - Model
    
    private var account: AccountProtocol?
    
    // MARK: - init
    
    init(account: Account) {
        self.account = account
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // Функция для проверки логина и пароля
    private func checkLoginData(login: String, pass: String) -> Bool {
        // Проверка на корректность логина
        let rightLogin = account?.login
        guard let rightLogin = rightLogin,
              login == rightLogin
        else {
            return false
        }
        
        // Проверка на корректность пароля
        let rightPass = account?.password
        guard let rightPass = rightPass,
              pass == rightPass
        else {
            return false
        }
        return true
    }
    
    // Функция для входа
    private func login() {
        account?.enteredStatus = true
        
        RootVCManager.shared.changeRootVC(VCType: .listScreen)
    }
    
    // Функция для выхода
    private func logout() {
        account?.enteredStatus = false
        
        RootVCManager.shared.changeRootVC(VCType: .loginScreen)
    }
    
    
    // MARK: - LoginVMProtocol
    
    func enter(login: String, pass: String) -> Bool {
        guard checkLoginData(login: login, pass: pass) else {
            return false
        }
        self.login()
        return true
    }
    
    func out() {
        logout()
    }
}
