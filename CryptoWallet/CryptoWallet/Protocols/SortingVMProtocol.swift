//
//  SortingVMProtocol.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 24.03.2023.
//

import Foundation

protocol SortingVMProtocol {
    func getSortingTypes() -> [SortingTypes]?
    
    var passSortingType: (SortingTypes) -> Void { get set }
}
