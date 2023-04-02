//
//  Sorting.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 22.03.2023.
//

import Foundation

enum SortingTypes: String, CaseIterable {
    case byPriceMax = "По цене max"
    case byPriceMin = "По цене min"
    case by24HoursHiToLo = "Рост цены за 24 часа +$"
    case by24HoursLoToHi = "Падение цены за 24 часа -$"
    case by1HourHiToLo = "Рост цены цены за 1 час +$"
    case by1HourLoToHi = "Падение цены цены за 1 час -$"
}

struct Sorting: SortingProtocol {
    var allTypesOfSorting: [SortingTypes] {
        SortingTypes.allCases
    }
}
