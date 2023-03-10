//
//  ScreenBuilder.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 10.03.2023.
//

import UIKit

final class ScreenBuilder {
    static func buildScreen(VCType: UIViewController) -> UINavigationController {
        let screen = VCType
        return MyNavigationController(rootViewController: screen)
    }
}

final class RootVCManager {
    static func changeRootVC(VCType: UIViewController) {
        var sceneDelegate: SceneDelegate? {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let delegate = windowScene.delegate as? SceneDelegate else { return nil }
            return delegate
        }
        sceneDelegate?.window?.rootViewController = ScreenBuilder.buildScreen(VCType: VCType)
    }
}
