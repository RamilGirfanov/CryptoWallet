//
//  LoginScreenVC.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 05.03.2023.
//

import UIKit

final class LoginScreenVC: UIViewController {
    
    // MARK: - ViewModel
    
    private var viewModel: LoginVMProtocol
    
    
    // MARK: - View
    
    private lazy var loginScreen: LoginScreenView = {
        let loginScreen = LoginScreenView()
        loginScreen.loginTextField.delegate = self
        loginScreen.passTextField.delegate = self
        return loginScreen
    }()
    
    
    // MARK: - init
    
    init(viewModel: LoginVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
     }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        setupToHideKeyboardOnTapOnView()
    }

    
    // MARK: - Функционал

    private func addTargets() {
        loginScreen.enterButton.addTarget(self,
                                          action: #selector(enter),
                                          for: .touchUpInside)
    }
    
    @objc
    private func enter() {
        // Проверка на заполненность логина
        if loginScreen.loginTextField.text?.isEmpty == true {
            let attributedString = NSAttributedString(string: "Введите логин",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            loginScreen.loginTextField.attributedPlaceholder = attributedString
        }
        
        // Проверка на заполненность пароля
        if loginScreen.passTextField.text?.isEmpty == true {
            let attributedString = NSAttributedString(string: "Введите пароль",
                                                      attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            loginScreen.passTextField.attributedPlaceholder = attributedString
        }
        
        guard let login = loginScreen.loginTextField.text else { return }
        guard let pass = loginScreen.passTextField.text else { return }
        
        viewModel.enter(login: login, pass: pass)
    }
}


//  MARK: - Расширение для клавиатуры что бы она скрывалась по нажанию на return

extension LoginScreenVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
