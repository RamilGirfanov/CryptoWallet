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
    static let account = Account()
    static let network = Network()
}

final class ScreenBuilder {
    static let shared = ScreenBuilder()
    private init() {}
    
    // Функция для предустановки логина и пароля
    func setupLoginData() {
        let login = "1234"
        let loginKey = UDEnterKeys.login.rawValue
        UserDefaults.standard.set(login, forKey: loginKey)
        
        let pass = "1234"
        let passKey = UDEnterKeys.password.rawValue
        UserDefaults.standard.set(pass, forKey: passKey)
    }
    
    func buildScreen(VCType: VCType) -> UINavigationController {
        switch VCType {
        case .loginScreen:
            let viewModel = LoginScreenVM(account: Models.account)
            let screen = LoginScreenVC(viewModel: viewModel)
            return MyNavigationController(rootViewController: screen)
        case .listScreen:
            let viewModel = ListScreenVM()
            let screen = ListScreenVC(viewModel: viewModel)
            return MyNavigationController(rootViewController: screen)
        }
    }
}


final class RootVCManager {
    static let shared = RootVCManager()
    private init() {}
    
    func changeRootVC(VCType: VCType) {
        
        var sceneDelegate: SceneDelegate? {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let delegate = windowScene.delegate as? SceneDelegate else { return nil }
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
