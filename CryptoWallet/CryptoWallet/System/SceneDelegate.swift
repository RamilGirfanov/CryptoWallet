//
//  SceneDelegate.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 05.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        GeneralProperties.setupLoginData()
        
        let enterStatus = Account.shared.enteredStatus
        
        switch enterStatus {
        case true:
            window.rootViewController = ScreenBuilder.shared.buildScreen(VCType: .listScreen)
        case false:
            window.rootViewController = ScreenBuilder.shared.buildScreen(VCType: .loginScreen)
        }
        
        window.makeKeyAndVisible()
        self.window = window
    }
}
