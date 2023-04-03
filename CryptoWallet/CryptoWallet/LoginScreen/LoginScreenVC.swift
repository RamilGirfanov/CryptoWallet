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
        
        if !viewModel.enter(login: login, pass: pass) {
            let alert = UIAlertController(title: "Проверьте данные",
                                          message: "Логин или пароль введены неверно",
                                          preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok",
                                         style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
}


// MARK: - Расширение для клавиши return

extension LoginScreenVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}


// MARK: - Обработка появления клавиатуры

extension LoginScreenVC {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(kbShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbShow(notification: NSNotification) {
        if let kbSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            loginScreen.scrollView.contentInset.bottom = kbSize.height + 50
            loginScreen.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        }
    }
    
    @objc private func kbHide() {
        loginScreen.scrollView.contentInset = .zero
        loginScreen.scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
