//
//  DescriptionScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 27.03.2023.
//

import Foundation

final class DescriptionScreenVM: DescriptionVMProtokol {
    
    // MARK: - Model
    
    private var coin: Coin?
    
    
    // MARK: - init
    
    init(coin: Coin) {
        self.coin = coin
    }
    
    
    // MARK: - DescriptionVMProtokol
    
    func getCoin() -> Coin? {
        coin
    }
}
