//
//  Constants.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 09.03.2023.
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

// Расширение для popOver
extension UIViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}


let commonCornerRadius: CGFloat = 10

let commonColor: UIColor = .systemBlue

let commonHeighTapObjects: CGFloat = 44
