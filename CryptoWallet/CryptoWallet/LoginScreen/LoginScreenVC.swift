//
//  LoginScreenVC.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 05.03.2023.
//

import UIKit

final class LoginScreenVC: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layout()
        enterDataSetup()
    }
    
    
    // MARK: - UIObjects
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 10
        stack.clipsToBounds = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        return stack
    }()
    
    let loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Введите логин"
        loginTextField.backgroundColor = .systemGray6
        loginTextField.autocapitalizationType = .none
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.layer.borderWidth = 0.5
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginTextField
    }()
    
    let passTextField: UITextField = {
        let passTextField = UITextField()
        passTextField.placeholder = "Введите пароль"
        passTextField.backgroundColor = .systemGray6
        passTextField.isSecureTextEntry = true
        passTextField.layer.borderColor = UIColor.lightGray.cgColor
        passTextField.layer.borderWidth = 0.5
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        return passTextField
    }()
    
    private lazy var enterButton: UIButton = {
        let enterButton = UIButton()
        enterButton.setTitle("Войти", for: .normal)
        enterButton.backgroundColor = .blue
        enterButton.layer.cornerRadius = 10
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.addTarget(self, action: #selector(enter), for: .touchUpInside)
        return enterButton
    }()
    
    
    // MARK: - Layout
    
    private func layout() {
        [label, stack, enterButton].forEach { view.addSubview($0) }
        
        [loginTextField, passTextField].forEach { stack.addArrangedSubview($0) }
        
        let safeIndent: CGFloat = 16
        
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: safeIndent),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -safeIndent),
            stack.heightAnchor.constraint(equalToConstant: 100),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -safeIndent),
            
            enterButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: safeIndent),
            enterButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: safeIndent),
            enterButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -safeIndent),
            enterButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    // MARK: - Функционал
    
    @objc
    private func enter() {
        let enterDataStatus = chekLoginData()
        
        if enterDataStatus {
            RootVCManager.changeRootVC(VCType: ListScreenVC())
            
            let enterStatus = true
            let key = UDEnterKeys.enterStatus.rawValue
            UserDefaults.standard.set(enterStatus, forKey: key)
        }
    }
    
//    Функция для предустановки логина и пароля
    private func enterDataSetup() {
        let login = "1234"
        let loginKey = UDEnterKeys.login.rawValue
        UserDefaults.standard.set(login, forKey: loginKey)
        
        let pass = "1234"
        let passKey = UDEnterKeys.password.rawValue
        UserDefaults.standard.set(pass, forKey: passKey)
    }
    
//    Функция проверки корректности логина и пароля
    private func chekLoginData() -> Bool {
        var dataStatus = false
        
//      Проверка на заполненность
        guard loginTextField.text?.isEmpty == false else {
            loginTextField.attributedPlaceholder = NSAttributedString(string: "Введите логин", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            return dataStatus
        }
        
        guard passTextField.text?.isEmpty == false else {
            passTextField.attributedPlaceholder = NSAttributedString(string: "Введите пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            return dataStatus
        }
        
//      Проверка на корректность логина
        let rightLogin = UserDefaults.standard.string(forKey: UDEnterKeys.login.rawValue)
        guard let rightLogin = rightLogin, loginTextField.text == rightLogin else { return dataStatus }
        
//      Проверка на корректность пароля
        let rightPass = UserDefaults.standard.string(forKey: UDEnterKeys.password.rawValue)
        guard let rightPass = rightPass, passTextField.text == rightPass else { return dataStatus }
        dataStatus = true
        
        return dataStatus
    }
}
