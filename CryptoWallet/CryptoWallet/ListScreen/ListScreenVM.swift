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
    
// Функция получения монеты
    private func getCoin(fromeURL url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            guard let data = data else { return }
            guard var coin = self.parseJSON(data: data) else { return }
                        
            self.network.coinID = coin.id
            let urlStringForImage = self.network.urlStringForImage
            
            self.getImage(fromeURLString: urlStringForImage) { data in
                coin.imageData = data
            }
            
            self.coinArray.append(coin)
            self.updateView(self.coinArray)
        }.resume()
    }
    
    // Функция получения изображения для монеты
    private func getImage(fromeURLString urlString: String,
                          completionHandler: @escaping (Data) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        guard let imageData = try? Data(contentsOf: url) else { return }
        completionHandler(imageData)
        /*
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data else { return }
            completionHandler(data)
        }.resume()
         */
    }
    
    // Функция пасинга JSON данных
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
    
    
    // MARK: - VMProcol
    
    var updateView: ([Coin]) -> Void = { _ in }
    
    func getData() {
        
        let urlArray = getUrlArray()
        
        urlArray.forEach { url in
            getCoin(fromeURL: url)
        }
        
        #warning("решить через многопоточность")
//        updateView(coinArray)
    }
    
    func sortCoins(sortType: Sorting.SortingTypes) {
        switch sortType {
        case .by24Hours:
            coinArray.sort {
                $0.ohlcvLast24Hour ?? 0 > $1.ohlcvLast24Hour ?? 0
            }
                        
        case .by1Hour:
            coinArray.sort {
                $0.ohlcvLast1Hour ?? 0 > $1.ohlcvLast1Hour ?? 0
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
