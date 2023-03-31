//
//  ListScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 14.03.2023.
//

import Foundation

final class ListScreenVM: ListVMProtocol {
    
    // MARK: - Models
    
    private var account = Account()
    
    private var network: NetworkProtocol?
    
    private var coinArray: [Coin] = [] {
        didSet {
            updateView(coinArray)
        }
    }
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    // MARK: - VMProcol
    
    func getData() {
        network?.getCoins { [weak self] coins in
            guard let self = self else { return }
            self.coinArray = coins
        }
    }
    
    var updateView: ([Coin]) -> Void = { _ in }
    
    func sortCoins(sortType: Sorting.SortingTypes) {
        switch sortType {
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
}

extension ListScreenVM: LoginVMProtocol {
    func enter(login: String, pass: String) {}
    
    func out() {
        account.enteredStatus = false
        
        RootVCManager.shared.changeRootVC(VCType: .loginScreen)
    }
}
