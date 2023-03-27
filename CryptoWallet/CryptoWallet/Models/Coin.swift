//
//  Coin.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 21.03.2023.
//

import Foundation

struct Coin {
    let id: String?
    let name: String?
    let symbol: String?
    private let priceUsd: Double?
    private let percentChangeUsdLast1Hour: Double?
    private let percentChangeUsdLast24Hours: Double?
    private let ohlcvLast1Hour: Double?
    private let ohlcvLast24Hour: Double?
    
    var imageData: Data?
        
    
    init(coinData: CoinData) {
        self.id = coinData.data?.id
        self.name = coinData.data?.name
        self.symbol = coinData.data?.symbol
        
        self.priceUsd = coinData.data?.marketData?.priceUsd
        
        self.percentChangeUsdLast1Hour = coinData.data?.marketData?.percentChangeUsdLast1Hour
        self.percentChangeUsdLast24Hours = coinData.data?.marketData?.percentChangeUsdLast24Hours
        
        self.ohlcvLast1Hour = coinData.data?.marketData?.ohlcvLast1Hour?.open
        self.ohlcvLast24Hour = coinData.data?.marketData?.ohlcvLast24Hour?.open
    }
    
    
    var priceString: String? {
        if let priceUsd = priceUsd {
            return String(format: "%.2f", priceUsd)
        } else {
            return nil
        }
    }
    
    var changePercentLast1HourString: String? {
        if let percentChangeUsdLast1Hour = percentChangeUsdLast1Hour {
            return String(format: "%.2f", percentChangeUsdLast1Hour)
        } else {
            return nil
        }
    }
    
    var changePercentLast24HourString: String? {
        if let percentChangeUsdLast24Hours = percentChangeUsdLast24Hours {
            return String(format: "%.2f", percentChangeUsdLast24Hours)
        } else {
            return nil
        }
    }
    
    
    
    
    var changePriceLast1Hour: Double? {
        if let ohlcvLast1Hour = ohlcvLast1Hour,
           let priceUsd = priceUsd
        {
            let changePriceLast1Hour = (priceUsd - ohlcvLast1Hour)
            return changePriceLast1Hour
        }
        return nil
    }

    var changePriceLast24Hour: Double? {
        if let ohlcvLast24Hour = ohlcvLast24Hour,
           let priceUsd = priceUsd
        {
            let changePriceLast24Hour = (priceUsd - ohlcvLast24Hour)
            return changePriceLast24Hour
        } else {
            return nil
        }
    }
    
    
    
    
    var changePriceLast1HourString: String? {
        if let changePriceLast1Hour = changePriceLast1Hour {
            return (String(format: "%.2f", changePriceLast1Hour))
        } else {
            return nil
        }
    }

    var changePriceLast24HourString: String? {
        if let changePriceLast24Hour = changePriceLast24Hour {
            return String(format: "%.2f", changePriceLast24Hour)
        } else {
            return nil
        }
    }
}
