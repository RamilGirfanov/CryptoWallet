//
//  CoinData.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 16.03.2023.
//

import Foundation

struct CoinData: Decodable {
    let data: DataModel
}

struct DataModel: Decodable {
    let symbol: String
    let name: String
    let marketData: MarketData
    
    enum CodingKeys: String, CodingKey {
        case symbol
        case name
        case marketData = "market_data"
    }
}

struct MarketData: Decodable {
    let priceUsd: Double
    let percentChangeUsdLast1Hour: Double
    let percentChangeUsdLast24Hours: Double
    
    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case percentChangeUsdLast1Hour = "percent_change_usd_last_1_hour"
        case percentChangeUsdLast24Hours = "percent_change_usd_last_24_hours"
    }
}
