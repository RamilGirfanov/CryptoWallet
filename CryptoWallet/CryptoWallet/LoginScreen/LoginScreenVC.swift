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
        AccauntManager.shared.setupLoginData()
    }
    
    
    // MARK: - UIObjects
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "loginBackgroundImage")
        imageView.applyBlurEffect()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = .systemFont(ofSize: 30)
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
        stack.backgroundColor = .systemGray6
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        return stack
    }()
    
    let loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Введите логин"
        loginTextField.backgroundColor = .clear
        loginTextField.borderStyle = .roundedRect
        loginTextField.autocapitalizationType = .none
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginTextField
    }()
    
    let passTextField: UITextField = {
        let passTextField = UITextField()
        passTextField.placeholder = "Введите пароль"
        passTextField.backgroundColor = .clear
        passTextField.isSecureTextEntry = true
        passTextField.borderStyle = .roundedRect
        passTextField.translatesAutoresizingMaskIntoConstraints = false
        return passTextField
    }()
    
    private lazy var enterButton: UIButton = {
        let enterButton = UIButton()
        enterButton.setTitle("Войти", for: .normal)
        enterButton.backgroundColor = commonColor
        enterButton.layer.cornerRadius = commonCornerRadius
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.addTarget(self, action: #selector(enter), for: .touchUpInside)
        return enterButton
    }()
    
    
    // MARK: - Layout
    
    private func layout() {
        [imageView, label, stack, enterButton].forEach { view.addSubview($0) }
        
        [loginTextField, passTextField].forEach { stack.addArrangedSubview($0) }
        
        let safeIndent: CGFloat = 16
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stack.heightAnchor.constraint(equalToConstant: commonHeighTapObjects * 2),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: safeIndent),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -safeIndent),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -safeIndent),
            
            enterButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: safeIndent),
            enterButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: safeIndent),
            enterButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -safeIndent),
            enterButton.heightAnchor.constraint(equalToConstant: commonHeighTapObjects)
        ])
    }
    
    
    // MARK: - Функционал
    
    @objc
    private func enter() {
        let enterDataStatus = chekLoginData()
        
        if enterDataStatus {
            RootVCManager.shared.changeRootVC(VCType: .listScreen)
            
            AccauntManager.shared.login()
        }
    }
    
    // Функция проверки корректности логина и пароля
    private func chekLoginData() -> Bool {
        var dataStatus = false
        
        // Проверка на заполненность логина
        guard loginTextField.text?.isEmpty == false, let login = loginTextField.text else {
            loginTextField.attributedPlaceholder = NSAttributedString(string: "Введите логин", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            return dataStatus
        }
        
        // Проверка на заполненность пароля
        guard passTextField.text?.isEmpty == false, let pass = passTextField.text else {
            passTextField.attributedPlaceholder = NSAttributedString(string: "Введите пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            return dataStatus
        }
        
        dataStatus = AccauntManager.shared.checkLoginData(login: login, pass: pass)
        
        return dataStatus
    }
}
