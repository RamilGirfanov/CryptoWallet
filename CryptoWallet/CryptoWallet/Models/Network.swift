//
//  Network.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 14.03.2023.
//

import Foundation

struct Network {
    let coinList = ["btc",
                    "eth",
                    "tron",
                    "luna",
                    "polkadot",
                    "dogecoin",
                    "tether",
                    "stellar",
                    "cardano",
                    "xrp"]
    
    var coin = ""
    
    var urlString: String {
        "https://data.messari.io/api/v1/assets/\(coin)/metrics"
    }
    
    var coinID = ""
    
    var urlStringForImage: String {
        "https://asset-images.messari.io/images/\(coinID)/64.png?v=2)"
    }
}
