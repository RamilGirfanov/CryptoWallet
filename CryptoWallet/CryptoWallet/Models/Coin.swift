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
    let ohlcvLast1Hour: Double?
    let ohlcvLast24Hour: Double?
    
    var imageData: Data?
        
    init(coinData: CoinData) {
        self.id = coinData.data?.id ?? "Данных нет"
        self.name = coinData.data?.name ?? "Данных нет"
        self.symbol = coinData.data?.symbol ?? "Данных нет"
        
        self.priceUsd = coinData.data?.marketData?.priceUsd
        
        self.percentChangeUsdLast1Hour = coinData.data?.marketData?.percentChangeUsdLast1Hour
        self.percentChangeUsdLast24Hours = coinData.data?.marketData?.percentChangeUsdLast24Hours
        
        self.ohlcvLast1Hour = coinData.data?.marketData?.ohlcvLast1Hour?.open
        self.ohlcvLast24Hour = coinData.data?.marketData?.ohlcvLast24Hour?.open
    }
    
    var priceUsdString: String {
        if let priceUsd = priceUsd {
            return "$\(String(format: "%.2f", priceUsd))"
        } else {
            return "Данных нет"
        }
    }
    
    var percentChangeUsdLast1HourString: String {
        if let percentChangeUsdLast1Hour = percentChangeUsdLast1Hour {
            return "(\(String(format: "%.2f", percentChangeUsdLast1Hour))%)"
        } else {
            return "Данных нет"
        }
    }
    
    var percentChangeUsdLast24HoursString: String {
        if let percentChangeUsdLast24Hours = percentChangeUsdLast24Hours {
            return "(\(String(format: "%.2f", percentChangeUsdLast24Hours))%)"
        } else {
            return "Данных нет"
        }
    }
    
    var changeUsdLast1HourString: String {
        if let ohlcvLast1Hour = ohlcvLast1Hour,
           let priceUsd = priceUsd
        {
            let changeUsdLast1Hour = (ohlcvLast1Hour - priceUsd)
            return "Изменение цены за 1ч: $\(String(format: "%.2f", changeUsdLast1Hour))"
        } else {
            return "Данных нет"
        }
    }

    var changeUsdLast24HoursString: String {
        if let ohlcvLast24Hour = ohlcvLast24Hour,
           let priceUsd = priceUsd
        {
            let changeUsdLast24Hours = (ohlcvLast24Hour - priceUsd)
            return "Изменение цены за 24ч: $\(String(format: "%.2f", changeUsdLast24Hours))"
        } else {
            return "Данных нет"
        }
    }
}
