//
//  Account.swift
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

struct Account {
    var login: String? {
        UserDefaults.standard.string(forKey: UDEnterKeys.login.rawValue)
    }
    var password: String? {
        UserDefaults.standard.string(forKey: UDEnterKeys.password.rawValue)
    }
}

