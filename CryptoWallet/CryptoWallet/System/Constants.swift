//
//  Constants.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 09.03.2023.
//

import UIKit

// Расширение для идентификатора ячеек
extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

// Ключи UserDefaults к свойствам авторизации
enum UDEnterKeys: String {
    case login
    case password
    case enterStatus
}

// Функция для предустановки логина и пароля
func setupLoginData() {
    let login = "1234"
    let loginKey = UDEnterKeys.login.rawValue
    UserDefaults.standard.set(login, forKey: loginKey)
    
    let pass = "1234"
    let passKey = UDEnterKeys.password.rawValue
    UserDefaults.standard.set(pass, forKey: passKey)
}

// Функция получения списка монет
//func getCoinList() -> [String] {
//    let coinList = ["btc", "eth", "tron", "luna", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]
//    return coinList
//}


let commonCornerRadius: CGFloat = 10

let commonColor: UIColor = .systemBlue
