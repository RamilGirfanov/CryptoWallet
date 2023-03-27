//
//  DescriptionScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 27.03.2023.
//

import Foundation

final class DescriptionScreenVM: DescriptionVMProtokol {
    
    private var coin: Coin?
    
    init(coin: Coin) {
        self.coin = coin
    }
    
    func getCoin() -> Coin? {
        coin
    }
}
