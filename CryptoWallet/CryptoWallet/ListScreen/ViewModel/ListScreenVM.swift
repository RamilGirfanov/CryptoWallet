//
//  ListScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 14.03.2023.
//

import Foundation

final class ListScreenVM: VMProtocolIn, VMProtocolOut {
    
    var network = Network()
    let coinList = getCoinList()
    
    private func getUrlArray() -> [String] {
        var urlArray: [String] = []
        
        coinList.forEach {
            network.coin = $0
            urlArray.append(network.urlString)
        }
        
        return urlArray
    }
    
    
    // MARK: - VMProcols
    
    func getData() {
        #warning("Настроить")
    }
    
    var updateView: (String) -> Void = { _ in }
}
