//
//  ListScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 14.03.2023.
//

import Foundation

final class ListScreenVM: ListVMProtocolIn, ListVMProtocolOut {
    
    private let accountManager = Account()
    
    private var network = Network()
    
    var completionHandler: ((String, String, Data) -> Void)?
    
    
    //    var coins = CoinData()
    
    //    private var dataArray: [Data] = []
    
    
    // Функция возвращающая массив URL
    
    private func getCoins() {
//        NetworkManager.shared.getAllCoinsData { coints in
//            print(coints)
        }
    
    
    
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
    
    private func parseJSON(data: Data) {
        
    }
    
    
    // MARK: - VMProcols
    
    func getData() {
//        let urlArray = getUrlArray()
//        guard !urlArray.isEmpty else { return }
//
//        let session = URLSession(configuration: .default)
//
//        urlArray.forEach { [weak self] url in
//            let task = session.dataTask(with: url) { data, response, error in
//                if let data {
//                    #warning("передать данные в VC")
////                    self?.dataArray.append(data)
//                }
//            }
//            task.resume()
//        }
    }
    
    var updateView: (String) -> Void = { _ in }
}

extension ListScreenVM: LoginVMProtocol {
    func enter(login: String, pass: String) {}

    func out() {
        let enterStatus = false
        let key = UDEnterKeys.enterStatus.rawValue
        UserDefaults.standard.set(enterStatus, forKey: key)
        
        RootVCManager.shared.changeRootVC(VCType: .loginScreen)
    }
}
