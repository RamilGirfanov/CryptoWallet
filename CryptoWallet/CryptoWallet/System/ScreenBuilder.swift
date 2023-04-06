//
//  ScreenBuilder.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 10.03.2023.
//

import UIKit

enum VCType {
    case loginScreen
    case listScreen
}

enum Models {
    static let account = Account.shared
    static let network = Network.shared
    static let sorting = Sorting()
}


final class ScreenBuilder {
    static let shared = ScreenBuilder()
    private init() {}
    
    func buildScreen(VCType: VCType) -> UINavigationController {
        switch VCType {
        case .loginScreen:
            let loginVM = LoginScreenVM(account: Models.account)
            
            let loginScreen = LoginScreenVC(viewModel: loginVM)
            
            return UINavigationController(rootViewController: loginScreen)
        case .listScreen:
            let listVM = ListScreenVM(network: Models.network,
                                      account: Models.account)
            
            let listScreen = ListScreenVC(viewModel: listVM)
            
            return UINavigationController(rootViewController: listScreen)
        }
    }
}


final class RootVCManager {
    static let shared = RootVCManager()
    private init() {}
    
    func changeRootVC(VCType: VCType) {
        
        var sceneDelegate: SceneDelegate? {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let delegate = windowScene.delegate as? SceneDelegate
            else {
                return nil
            }
            return delegate
        }
        
        switch VCType {
        case .loginScreen:
            sceneDelegate?.window?.rootViewController = ScreenBuilder.shared.buildScreen(VCType: .loginScreen)
        case .listScreen:
            sceneDelegate?.window?.rootViewController = ScreenBuilder.shared.buildScreen(VCType: .listScreen)
        }
    }
}
