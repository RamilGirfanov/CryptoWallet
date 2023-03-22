/*
struct CryptoCoin: Decodable {
    var status: Status?
    var data: DataModel?
}

struct DataModel: Decodable {
    
   let id: String?
   let symbol: String?
   let slug: String?
   var marketData: MarketData?
    
    enum CodingKeys: String, CodingKey {
        case symbol
        case slug
        case id
        case marketData = "market_data"
    }
    
}

struct MarketData: Decodable {
    
    var priceUSD: Double?
    var percentChangeUSDLast1Hour: Double?
    var percentChangeUSDLast24Hours: Double?
    
    enum CodingKeys: String, CodingKey {
        case priceUSD = "price_usd"
        case percentChangeUSDLast1Hour = "percent_change_usd_last_1_hour"
        case percentChangeUSDLast24Hours = "percent_change_usd_last_24_hours"
    }

}

// MARK: - Status
struct Status: Decodable {
    let elapsed: Int?
    let timestamp: String?
}

*/
