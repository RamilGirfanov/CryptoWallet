//
//  Network.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 14.03.2023.
//

import Foundation

struct Network {    
    var coin: String = ""
    
    var urlString: String {
        "https://data.messari.io/api/v1/assets/\(coin)/metrics"
    }
}
