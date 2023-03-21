//
//  Coin.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 21.03.2023.
//

import Foundation

struct Coin {
    let name: String
    let symbol: String
    private let priceUsd: Double
    private let percentChangeUsdLast1Hour: Double
    private let percentChangeUsdLast24Hours: Double
        
    init(coinData: CoinData) {
        self.name = coinData.data.name
        self.symbol = coinData.data.symbol
        self.priceUsd = coinData.data.marketData.priceUsd
        self.percentChangeUsdLast1Hour = coinData.data.marketData.percentChangeUsdLast1Hour
        self.percentChangeUsdLast24Hours = coinData.data.marketData.percentChangeUsdLast24Hours
    }
    
    var priceUsdString: String {
        String(format: "%.1f", priceUsd)
    }
    
    var percentChangeUsdLast1HourString: String {
        String(format: "%.2f", percentChangeUsdLast1Hour)
    }
    
    var changeUsdLast1HourString: String {
        let changeUsdLast1Hour = priceUsd - (priceUsd / (1 + percentChangeUsdLast1Hour / 100))
        return String(format: "%.1f", changeUsdLast1Hour)
    }
    
    var percentChangeUsdLast24HoursString: String {
        String(format: "%.2f", percentChangeUsdLast24Hours)
    }
    
    var changeUsdLast24HoursString: String {
        let changeUsdLast24Hours = priceUsd - (priceUsd / (1 + percentChangeUsdLast24Hours / 100))
        return String(format: "%.1f", changeUsdLast24Hours)
    }
}
