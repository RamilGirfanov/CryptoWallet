//
//  MVVMProtocols.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 14.03.2023.
//

import Foundation

protocol VMProtocolIn {
    func getData()
}

protocol VMProtocolOut {
    var updateView: (String) -> Void { get set }
}
