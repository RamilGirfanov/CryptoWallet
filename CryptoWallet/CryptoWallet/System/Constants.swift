//
//  Constants.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 09.03.2023.
//

import UIKit

struct GeneralProperties {
    static let cornerRadius: CGFloat = 10
    
    static let color: UIColor = .systemBlue
    
    static let heighTapObjects: CGFloat = 44
    
    // Хардкод функция для предустановки логина и пароля
    static func setupLoginData() {
        let login = "1234"
        let loginKey = UDEnterKeys.login
        UserDefaults.standard.set(login, forKey: loginKey)
        
        let pass = "1234"
        let passKey = UDEnterKeys.password
        UserDefaults.standard.set(pass, forKey: passKey)
    }
}

