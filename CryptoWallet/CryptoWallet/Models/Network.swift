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
    
    #warning("Убрать")
    var coin: String = "btc"
    
    var urlString: String {
        "https://data.messari.io/api/v1/assets/\(coin)/metrics"
    }
}
