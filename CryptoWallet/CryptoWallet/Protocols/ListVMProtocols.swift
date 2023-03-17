//
//  ListVMProtocols.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 14.03.2023.
//

import Foundation

protocol ListVMProtocolIn {
    func getData()
}

protocol ListVMProtocolOut {
    var updateView: (String) -> Void { get set }
}
