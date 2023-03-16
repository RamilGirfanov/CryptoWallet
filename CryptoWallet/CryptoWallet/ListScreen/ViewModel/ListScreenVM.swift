//
//  ListScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 14.03.2023.
//

import Foundation

final class ListScreenVM: VMProtocolIn, VMProtocolOut {
    
    private var network = Network()
    
    private let coinList = getCoinList()
    
    private var dataArray: [Data] = []
    
    /*
    private var url: URL?
    
    
    
    private func prepareURL(coin: String) {
        network.coin = coin
        
        let url = URL(string: network.urlString)
        
        if let url {
            self.url = url
        }
    }
    */
    
    private func getUrlArray() -> [URL] {
        var urlArray: [URL] = []
        
        guard !coinList.isEmpty else { return urlArray }
        
        coinList.forEach { coin in
            network.coin = coin
            if let url = URL(string: network.urlString) {
                urlArray.append(url)
            }
        }
        
        return urlArray
    }
        
    
    // MARK: - VMProcols
    
    func getData() {
        let urlArray = getUrlArray()
        guard !urlArray.isEmpty else { return }
        
        let session = URLSession(configuration: .default)
        
        urlArray.forEach { [weak self] url in
            let task = session.dataTask(with: url) { data, response, error in
                if let data {
                    #warning("передать данные в VC")
                    self?.dataArray.append(data)
                }
            }
        }
    }
    
    var updateView: (String) -> Void = { _ in }
}