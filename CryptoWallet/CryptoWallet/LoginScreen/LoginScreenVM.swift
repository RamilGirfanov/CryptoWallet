//
//  LoginScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 17.03.2023.
//

import Foundation

final class LoginScreenVM: LoginVMProtocol {
    
    // MARK: - Model
    
    private var account: Account
    
    // MARK: - init
    
    init(account: Account) {
        self.account = account
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // Функция для проверки логина и пароля
    func checkLoginData(login: String, pass: String) -> Bool {
        // Проверка на корректность логина
        let keyForRightLogin = UDEnterKeys.login
        let rightLogin = UserDefaults.standard.string(forKey: keyForRightLogin)
        guard let rightLogin = rightLogin,
              login == rightLogin
        else { return false }
        
        // Проверка на корректность пароля
        let keyForRightPass = UDEnterKeys.password
        let rightPass = UserDefaults.standard.string(forKey: keyForRightPass)
        guard let rightPass = rightPass,
              pass == rightPass
        else { return false }
        return true
    }
    
    // Функция для входа
    func login() {
        account.enteredStatus = true
        
        RootVCManager.shared.changeRootVC(VCType: .listScreen)
    }
    
    // Функция для выхода
    func logout() {
        account.enteredStatus = false

        RootVCManager.shared.changeRootVC(VCType: .loginScreen)
    }

    
    // MARK: - LoginVMProtocol
    
    func enter(login: String, pass: String) {
        guard checkLoginData(login: login, pass: pass) else { return }
        
        self.login()
    }
    
    func out() {
        logout()
    }
}
