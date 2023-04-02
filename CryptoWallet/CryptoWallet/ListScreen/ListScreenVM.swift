//
//  ListScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 14.03.2023.
//

import Foundation

final class ListScreenVM: ListVMProtocol, LoginVMProtocol {
    
    // MARK: - Models
    
    private var network: NetworkProtocol?
    
    private var account: AccountProtocol?
    
    private var coinArray: [Coin] = [] {
        didSet {
            updateView(coinArray)
        }
    }
    
    private var sortType: SortingTypes = .byPriceMax
    
    
    // MARK: - init
    
    init(network: NetworkProtocol, account: AccountProtocol) {
        self.network = network
        self.account = account
    }
    
    
    // MARK: - ListVMProtocol
    
    func getData() {
        network?.getCoins { [weak self] coins in
            guard let self = self else { return }
            self.coinArray = coins
            sortCoins(sortType: sortType)
        }
    }
    
    var updateView: ([Coin]) -> Void = { _ in }
    
    func sortCoins(sortType: SortingTypes) {
        self.sortType = sortType
        
        switch sortType {
        case .byPriceMax:
            coinArray.sort {
                $0.priceUsd ?? 0 > $1.priceUsd ?? 0
            }
        case .byPriceMin:
            coinArray.sort {
                $0.priceUsd ?? 0 < $1.priceUsd ?? 0
            }
        case .by24HoursHiToLo:
            coinArray.sort {
                $0.changePriceLast24Hour ?? 0 > $1.changePriceLast24Hour ?? 0
            }
        case .by24HoursLoToHi:
            coinArray.sort {
                $0.changePriceLast24Hour ?? 0 < $1.changePriceLast24Hour ?? 0
            }
        case .by1HourHiToLo:
            coinArray.sort {
                $0.changePriceLast1Hour ?? 0 > $1.changePriceLast1Hour ?? 0
            }
        case .by1HourLoToHi:
            coinArray.sort {
                $0.changePriceLast1Hour ?? 0 < $1.changePriceLast1Hour ?? 0
            }
        }
    }
    
    
    // MARK: - LoginVMProtocol
    
    func enter(login: String, pass: String) -> Bool {
        return true
    }
    
    func out() {
        account?.enteredStatus = false
        
        RootVCManager.shared.changeRootVC(VCType: .loginScreen)
    }
}
