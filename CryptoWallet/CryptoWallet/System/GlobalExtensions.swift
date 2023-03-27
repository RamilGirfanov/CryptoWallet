//
//  GlobalExtensions.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 25.03.2023.
//

import UIKit

// Расширение для идентификатора ячеек
extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

// Расширение для блюра
extension UIImageView {
    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}

// Расширение для клавиатуры что бы она скрывалась по нажанию на любое место экрана
extension UIViewController {
    func setupToHideKeyboardOnTapOnView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// Расширение для popOver
extension UIViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}

extension Double {
    var toString: String? {
        String(format: "%.2f", self)
    }
}

//extension URL {
//    static func endpoint(for coin: String) -> URL {
//        var baseEndpoint.assets = self.baseEndpoimt
//        baseEndpoint.fragment = "assets"
//        baseEndpoint.fragment = coin
//        
//        guard let url = URL(string: "https://data.messari.io/api/v1/assets/\(coin)/metrics") else {
//            preconditionFailure("Invalid url")
//        }
//        return url
//    }
//
//    var baseEndpoimt: URLComponents {
//        var components = URLComponents()
//        components.scheme = "http://"
//        components.host = "data.messari.io"
//
//        return components
//    }
//}
