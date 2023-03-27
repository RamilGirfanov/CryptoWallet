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
    
    private var network = Network()
    
    private var coinArray: [Coin] = []
    
    
    // MARK: - VMProcol
    
    func getData() {
        network.getCoins { [weak self] coin in
            guard let self = self else { return }
            self.coinArray.append(coin)
            self.updateView(self.coinArray)
        }
    }
    
    var updateView: ([Coin]) -> Void = { _ in }
    
    func sortCoins(sortType: Sorting.SortingTypes) {
        switch sortType {
        case .by24HoursHiToLo:
            coinArray.sort {
                $0.ohlcvLast24Hour ?? 0 > $1.ohlcvLast24Hour ?? 0
            }
            
        case .by24HoursLoToHi:
            coinArray.sort {
                $0.ohlcvLast24Hour ?? 0 < $1.ohlcvLast24Hour ?? 0
            }
        case .by1HourHiToLo:
            coinArray.sort {
                $0.ohlcvLast1Hour ?? 0 > $1.ohlcvLast1Hour ?? 0
            }
            
        case .by1HourLoToHi:
            coinArray.sort {
                $0.ohlcvLast1Hour ?? 0 < $1.ohlcvLast1Hour ?? 0
            }
        }
        updateView(coinArray)
    }
}

extension ListScreenVM: LoginVMProtocol {
    func enter(login: String, pass: String) {}

    func out() {
        account.enteredStatus = false
                
        RootVCManager.shared.changeRootVC(VCType: .loginScreen)
    }
}
