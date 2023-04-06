//
//  Network.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 14.03.2023.
//

import Foundation

final class Network: NetworkProtocol {
    static let shared = Network()
    private init() {}
    
    private let coinList = ["btc",
                            "eth",
                            "tron",
                            "luna",
                            "polkadot",
                            "dogecoin",
                            "tether",
                            "stellar",
                            "cardano",
                            "xrp"]
    
    private var coinString = ""
    
    private var urlString: String {
        "https://data.messari.io/api/v1/assets/\(coinString)/metrics"
    }
    
    private var coinID = ""
    
    private var urlStringForImage: String {
        "https://asset-images.messari.io/images/\(coinID)/64.png?v=2)"
    }
    
    
    // MARK: - Методы получения монеты
    
    // Функция возвращающая массив URL
    private func getUrlArray() -> [URL] {
        var urlArray: [URL] = []
        
        guard !coinList.isEmpty else { return urlArray }
        
        coinList.forEach {
            coinString = $0
            
            guard let url = URL(string: urlString) else { return }
            
            urlArray.append(url)
        }
        return urlArray
    }
    
    // Функция пасинга JSON данных
    private func parseJSON(data: Data) -> Coin? {
        let decoder = JSONDecoder()
        
        do {
            let coinData = try decoder.decode(CoinData.self, from: data)
            let coin = Coin(coinData: coinData)
            return coin
        } catch let error as NSError {
            print("Ошибка парсинга JSON:\(error.localizedDescription)")
        }
        return nil
    }
    
    // Функция получения изображения для монеты
    private func getImage(fromeURLString urlString: String,
                          completionHandler: @escaping (Data) -> Void) {
        guard
            let url = URL(string: urlString),
            let imageData = try? Data(contentsOf: url)
        else {
            return
        }
        completionHandler(imageData)
    }
    
    // Функция получения массива монет из сети
    func getCoins(completionHandler: @escaping ([Coin]) -> Void) {
        
        var coinArray: [Coin] = []
        
        // Получение массива ссылок на монеты
        let urlArray = getUrlArray()
        
        let group = DispatchGroup()
        
        urlArray.forEach { url in
            group.enter()
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let session =  URLSession.shared
            
            let task = session.dataTask(with: request) { [weak self] data, response, error in
                guard let self = self else { return }
                
                if let error = error {
                    print("URL: \(url) \nОшибка при выполнении GET запроса: \(error.localizedDescription)")
                    return
                }
                
                guard
                    let data = data,
                    var coin = self.parseJSON(data: data)
                else {
                    return
                }
                
                
                // Проверка на пустую монету и получение изображения для монеты
                if coin.priceUsd != nil {
                    if let coinID = coin.id {
                        self.coinID = coinID
                        let urlStringForImage = self.urlStringForImage
                        
                        self.getImage(fromeURLString: urlStringForImage) { data in
                            coin.imageData = data
                        }
                    }
                    
                    coinArray.append(coin)
                }
                group.leave()
            }
            task.resume()
        }
        group.notify(queue: .main) {
            completionHandler(coinArray)
        }
    }
}
