//
//  ListScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 14.03.2023.
//

import Foundation

final class ListScreenVM: ListVMProtocolIn, ListVMProtocolOut {
    
    // MARK: - Models
    
    private var account = Account()
    
    private var network = Network()
    
    
    var coinArray: [Coin] = []
    
    
    
    
    // Функция возвращающая массив URL
    private func getUrlArray() -> [URL] {
        var urlArray: [URL] = []
        
        guard !network.coinList.isEmpty else { return urlArray }
        
        network.coinList.forEach { coin in
            network.coin = coin
            guard let url = URL(string: network.urlString) else { return }
            urlArray.append(url)
        }
        return urlArray
    }
    
//    Функция пасинга JSON данных
    private func parseJSON(data: Data) -> Coin? {
        let decoder = JSONDecoder()
        
        do {
            let coinData = try decoder.decode(CoinData.self, from: data)
            let coin = Coin(coinData: coinData)
            return coin
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    
    // MARK: - VMProcols
    
    var updateView: ([Coin]) -> Void = { _ in }
    
    func getData() {
        
        guard let url = URL(string: network.urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if let data = data {
                if let coin = self.parseJSON(data: data) {
                    self.coinArray.append(coin)
                    self.updateView(self.coinArray)
                }
            }
        }.resume()
        #warning("решить через многопоточность")
//        updateView(coinArray)
    }
    
}

extension ListScreenVM: LoginVMProtocol {
    func enter(login: String, pass: String) {}

    func out() {
        account.enteredStatus = false
                
        RootVCManager.shared.changeRootVC(VCType: .loginScreen)
    }
}
