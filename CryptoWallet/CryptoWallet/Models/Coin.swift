//
//  Coin.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 21.03.2023.
//

import Foundation

struct Coin {
    let id: String
    let name: String
    let symbol: String
    let priceUsd: Double?
    let percentChangeUsdLast1Hour: Double?
    let percentChangeUsdLast24Hours: Double?
    
    var imageData: Data?
        
    init(coinData: CoinData) {
        self.id = coinData.data?.id ?? "Данных нет"
        self.name = coinData.data?.name ?? "Данных нет"
        self.symbol = coinData.data?.symbol ?? "Данных нет"
        
        self.priceUsd = coinData.data?.marketData?.priceUsd
        
        self.percentChangeUsdLast1Hour = coinData.data?.marketData?.percentChangeUsdLast1Hour
        self.percentChangeUsdLast24Hours = coinData.data?.marketData?.percentChangeUsdLast24Hours
    }
    
    var priceUsdString: String {
        if let priceUsd {
            return "$\(String(format: "%.2f", priceUsd))"
        } else {
            return "Данных нет"
        }
    }
    
    var percentChangeUsdLast1HourString: String {
        if let percentChangeUsdLast1Hour {
            return "(\(String(format: "%.2f", percentChangeUsdLast1Hour))%)"
        } else {
            return "Данных нет"
        }
    }
    
    var changeUsdLast1HourString: String {
        if let percentChangeUsdLast1Hour, let priceUsd {
            let changeUsdLast1Hour = priceUsd - (priceUsd / (1 + percentChangeUsdLast1Hour / 100))
            return "Изменение цены за 1ч: \(String(format: "%.2f", changeUsdLast1Hour))"
        } else {
            return "Данных нет"
        }
    }
    
    var percentChangeUsdLast24HoursString: String {
        if let percentChangeUsdLast24Hours {
            return "(\(String(format: "%.2f", percentChangeUsdLast24Hours))%)"
        } else {
            return "Данных нет"
        }
    }
    
    var changeUsdLast24HoursString: String {
        if let percentChangeUsdLast24Hours, let priceUsd {
            let changeUsdLast24Hours = priceUsd - (priceUsd / (1 + percentChangeUsdLast24Hours / 100))
            return "Изменение цены за 24ч: \(String(format: "%.2f", changeUsdLast24Hours))"
        } else {
            return "Данных нет"
        }
    }
}
