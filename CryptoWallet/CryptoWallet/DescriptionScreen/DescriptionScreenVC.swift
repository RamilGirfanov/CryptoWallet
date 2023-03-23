//
//  DescriptionScreenVC.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 10.03.2023.
//

import UIKit

final class DescriptionScreenVC: UIViewController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layout()
    }
    
    // MARK: - UIObjects
    
    private let symbolLabel: UILabel = {
        let symbolLabel = UILabel()
        symbolLabel.font = .systemFont(ofSize: 20, weight: .bold)
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        return symbolLabel
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 20)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let textStack: UIStackView = {
        let textStack = UIStackView()
        textStack.axis = .vertical
        textStack.distribution = .fillEqually
        textStack.translatesAutoresizingMaskIntoConstraints = false
        return textStack
    }()
    
    private let priceUsdTextLabel: UILabel = {
        let priceUsdTextLabel = UILabel()
        priceUsdTextLabel.text = "Стоимость в USD: "
        priceUsdTextLabel.font = .systemFont(ofSize: 15)
        priceUsdTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceUsdTextLabel
    }()
    
    private let priceEthTextLabel: UILabel = {
        let priceEthTextLabel = UILabel()
        priceEthTextLabel.text = "Стоимость в ETH: "
        priceEthTextLabel.font = .systemFont(ofSize: 15)
        priceEthTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceEthTextLabel
    }()
    
    private let changeUsdLastHourTextLabel: UILabel = {
        let changeUsdLastHourTextLabel = UILabel()
        changeUsdLastHourTextLabel.text = "Изменение стоимости в USD за час: "
        changeUsdLastHourTextLabel.font = .systemFont(ofSize: 15)
        changeUsdLastHourTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return changeUsdLastHourTextLabel
    }()
    
    
    private let changeUsdLastDayTextLabel: UILabel = {
        let changeUsdLastDayTextLabel = UILabel()
        changeUsdLastDayTextLabel.text = "Изменение стоимости в USD за сутки: "
        changeUsdLastDayTextLabel.font = .systemFont(ofSize: 15)
        changeUsdLastDayTextLabel.translatesAutoresizingMaskIntoConstraints = false
        return changeUsdLastDayTextLabel
    }()
    
    private let dataStack: UIStackView = {
        let textStack = UIStackView()
        textStack.axis = .vertical
        textStack.distribution = .fillEqually
        textStack.translatesAutoresizingMaskIntoConstraints = false
        return textStack
    }()
    
    private let priceUsdLabel: UILabel = {
        let priceUsdLabel = UILabel()
        priceUsdLabel.font = .systemFont(ofSize: 15)
        priceUsdLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceUsdLabel
    }()
    
    private let priceEthLabel: UILabel = {
        let priceEthLabel = UILabel()
        priceEthLabel.font = .systemFont(ofSize: 15)
        priceEthLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceEthLabel
    }()
    
    private let changeUsdLastHourLabel: UILabel = {
        let changeUsdLastHourLabel = UILabel()
        changeUsdLastHourLabel.font = .systemFont(ofSize: 15)
        changeUsdLastHourLabel.translatesAutoresizingMaskIntoConstraints = false
        return changeUsdLastHourLabel
    }()
    
    
    private let changeUsdLastDayLabel: UILabel = {
        let changeUsdLastDayLabel = UILabel()
        changeUsdLastDayLabel.font = .systemFont(ofSize: 15)
        changeUsdLastDayLabel.translatesAutoresizingMaskIntoConstraints = false
        return changeUsdLastDayLabel
    }()
    
    private let stackForStack: UIStackView = {
        let stackForStack = UIStackView()
        stackForStack.axis = .horizontal
        stackForStack.distribution = .fillEqually
        stackForStack.translatesAutoresizingMaskIntoConstraints = false
        return stackForStack
    }()


    // MARK: - Layout
    
    private func layout() {
        [symbolLabel, nameLabel, stackForStack].forEach { view.addSubview($0) }
        
        [textStack, dataStack].forEach { stackForStack.addArrangedSubview($0)}
        
        [priceUsdTextLabel, priceEthTextLabel, changeUsdLastHourTextLabel, changeUsdLastDayTextLabel].forEach { textStack.addArrangedSubview($0)}
        [priceUsdLabel, priceEthLabel, changeUsdLastHourLabel, changeUsdLastDayLabel].forEach { dataStack.addArrangedSubview($0)}
        
        let safeIndent1: CGFloat = 16
        let safeIndent2: CGFloat = 8
        
        NSLayoutConstraint.activate([
            symbolLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: safeIndent2),
            
            stackForStack.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: safeIndent1),
            stackForStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: safeIndent1),
            stackForStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -safeIndent1)
        ])
    }
    
//    private func setupData(data: Coin) {
//
//    }
}
