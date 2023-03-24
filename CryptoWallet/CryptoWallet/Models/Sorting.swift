//
//  Sorting.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 22.03.2023.
//

import Foundation

struct Sorting {
    
    enum SortingTypes: String, CaseIterable {
        case by24HoursHiToLo = "Дельта цены за 24 часа по убыванию"
        case by24HoursLoToHi = "Дельта цены за 24 часа по возрастанию"
        case by1HourHiToLo = "Дельта цены цены за 1 час по убыванию"
        case by1HourLoToHi = "Дельта цены цены за 1 час по возрастанию"
    }
    
    var allTypesOfSorting: [SortingTypes] {
        SortingTypes.allCases
    }
}
