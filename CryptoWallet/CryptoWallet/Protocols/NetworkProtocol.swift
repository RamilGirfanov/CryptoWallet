//
//  NetworkProtocol.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 27.03.2023.
//

import Foundation

protocol NetworkProtocol {
    func getCoins(completionHandler: @escaping (Coin) -> Void)
}
