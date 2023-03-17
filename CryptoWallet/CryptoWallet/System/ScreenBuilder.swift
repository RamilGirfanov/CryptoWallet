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

final class ScreenBuilder {
    static let shared = ScreenBuilder()
    
    private init() {}
    
    func buildScreen(VCType: VCType) -> UINavigationController {
        
        switch VCType {
        case .loginScreen:
            let screen = LoginScreenVC()
            let VM = LoginScreenVM()
            screen.VM = VM
            return MyNavigationController(rootViewController: screen)
        case .listScreen:
            let screen = ListScreenVC()
            let VM = ListScreenVM()
            screen.viewModel = VM
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
