//
//  Constants.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 09.03.2023.
//

import UIKit

let commonCornerRadius: CGFloat = 10

let commonColor: UIColor = .systemBlue

let commonHeighTapObjects: CGFloat = 44

// Функция для предустановки логина и пароля
#warning("Сделать экран регистрации")
func setupLoginData() {
    let login = "1234"
    let loginKey = UDEnterKeys.login
    UserDefaults.standard.set(login, forKey: loginKey)
    
    let pass = "1234"
    let passKey = UDEnterKeys.password
    UserDefaults.standard.set(pass, forKey: passKey)
}
