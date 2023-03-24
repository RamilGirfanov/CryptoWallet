//
//  CoinData.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 16.03.2023.
//

import Foundation

struct CoinData: Decodable {
    let data: DataModel?
}

struct DataModel: Decodable {
    let id: String?
    let name: String?
    let symbol: String?
    let marketData: MarketData?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case marketData = "market_data"
    }
}

struct MarketData: Decodable {
    let priceUsd: Double?
    let percentChangeUsdLast1Hour: Double?
    let percentChangeUsdLast24Hours: Double?
    let ohlcvLast1Hour: OhlcvLastHour?
    let ohlcvLast24Hour: OhlcvLastHour?
    
    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case percentChangeUsdLast1Hour = "percent_change_usd_last_1_hour"
        case percentChangeUsdLast24Hours = "percent_change_usd_last_24_hours"
        case ohlcvLast1Hour = "ohlcv_last_1_hour"
        case ohlcvLast24Hour = "ohlcv_last_24_hour"
    }
}

struct OhlcvLastHour: Decodable {
    let open: Double?
}
