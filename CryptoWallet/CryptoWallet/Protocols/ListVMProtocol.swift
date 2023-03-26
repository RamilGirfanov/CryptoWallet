//
//  ListVMProtocols.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 14.03.2023.
//

import Foundation

protocol ListVMProtocol {
    func getData()
    
    var updateView: ([Coin]) -> Void { get set }
    
    func sortCoins(sortType: Sorting.SortingTypes)
}
