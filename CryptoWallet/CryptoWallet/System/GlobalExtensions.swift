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

// Расширение для блюра картинки
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
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(UIViewController.dismissKeyboard))
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

// Расшитение типа Double для перевода значения в String
extension Double {
    var toString: String? {
        String(format: "%.2f", self)
    }
}
