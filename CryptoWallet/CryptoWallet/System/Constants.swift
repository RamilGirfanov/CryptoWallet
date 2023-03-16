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

enum UDEnterKeys: String {
    case login
    case password
    case enterStatus
}


let commonCornerRadius: CGFloat = 10

let commonColor: UIColor = .systemBlue
