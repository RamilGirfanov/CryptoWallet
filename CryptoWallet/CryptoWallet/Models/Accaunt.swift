//
//  Accaunt.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 17.03.2023.
//

import Foundation

// Ключи UserDefaults к свойствам авторизации
enum UDEnterKeys: String {
    case login
    case password
    case enterStatus
}

class AccauntManager {
    static let shared = AccauntManager()
    
    private init(){}
    
    // Функция для предустановки логина и пароля
    func setupLoginData() {
        let login = "1234"
        let loginKey = UDEnterKeys.login.rawValue
        UserDefaults.standard.set(login, forKey: loginKey)
        
        let pass = "1234"
        let passKey = UDEnterKeys.password.rawValue
        UserDefaults.standard.set(pass, forKey: passKey)
    }

    
    func login() {
        let enterStatus = true
        let key = UDEnterKeys.enterStatus.rawValue
        UserDefaults.standard.set(enterStatus, forKey: key)
    }
    
    func logout() {
        let enterStatus = false
        let key = UDEnterKeys.enterStatus.rawValue
        UserDefaults.standard.set(enterStatus, forKey: key)
    }
    
    func checkLoginData(login: String, pass: String) -> Bool {
        // Проверка на корректность логина
        let rightLogin = UserDefaults.standard.string(forKey: UDEnterKeys.login.rawValue)
        guard let rightLogin = rightLogin, login == rightLogin else { return false }
        
        // Проверка на корректность пароля
        let rightPass = UserDefaults.standard.string(forKey: UDEnterKeys.password.rawValue)
        guard let rightPass = rightPass, pass == rightPass else { return false }
        return true
    }
}

