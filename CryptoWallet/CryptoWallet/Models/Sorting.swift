//
//  Sorting.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 22.03.2023.
//

import Foundation

struct Sorting {
    
    enum Types: String, CaseIterable {
        case by24Hours = "По изменению цены за 24 часа"
        case by1Hour = "По изменению цены за 1 час"
    }
    
    var allTypesOfSorting: [Types] {
        Types.allCases
    }
}
