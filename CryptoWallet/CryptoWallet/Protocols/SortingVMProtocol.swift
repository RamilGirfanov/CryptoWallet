//
//  SortingVMProtocol.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 24.03.2023.
//

import Foundation

protocol SortingVMProtocol {
    func getSortingTypes() -> [Sorting.SortingTypes]
    
    var passSortingType: (Sorting.SortingTypes) -> Void { get set }
}
