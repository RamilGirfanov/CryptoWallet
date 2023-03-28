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
    let priceUsd: Double?
    let percentChangeUsdLast1Hour: Double?
    let percentChangeUsdLast24Hours: Double?
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
}
