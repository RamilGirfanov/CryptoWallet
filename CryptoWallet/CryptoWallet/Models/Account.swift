//
//  Account.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 17.03.2023.
//

import Foundation

// Ключи UserDefaults к свойствам авторизации
enum UDEnterKeys {
    static let login = "login"
    static let password = "password"
    static let enterStatus = "enterStatus"
}


struct Account: AccountProtocol {
    static let shared = Account()
    private init() {}
    
    var enteredStatus: Bool {
        get {
            UserDefaults.standard.bool(forKey: UDEnterKeys.enterStatus)
        }
        set {
            UserDefaults.standard.set(newValue,
                                      forKey: UDEnterKeys.enterStatus)
        }
    }
    
    var login: String? {
        UserDefaults.standard.string(forKey: UDEnterKeys.login)
    }
    var password: String? {
        UserDefaults.standard.string(forKey: UDEnterKeys.password)
    }
}
