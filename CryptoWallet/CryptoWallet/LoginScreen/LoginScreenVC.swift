//
//  LoginScreenVC.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 05.03.2023.
//

import UIKit

class LoginScreenVC: UIViewController {
    
    let loginScreen: LoginScreen = {
        let loginScreen = LoginScreen()
//        loginScreen.loginTextField.delegate = self
//        loginScreen.passTextField.delegate = self
        return loginScreen
    }()
    
    override func loadView() {
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
