//
//  CoinCell.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 06.03.2023.
//

import UIKit

final class CoinCell: UITableViewCell {
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UIObjects
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Название"
        nameLabel.font = .systemFont(ofSize: 20, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.text = "Цена"
        priceLabel.font = .systemFont(ofSize: 20)
        priceLabel.textAlignment = .right
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    }()
    
    private let changePriceLabel: UILabel = {
        let changePriceLabel = UILabel()
        changePriceLabel.text = "Изменение"
        changePriceLabel.font = .systemFont(ofSize: 15)
        changePriceLabel.textAlignment = .right
        changePriceLabel.translatesAutoresizingMaskIntoConstraints = false
        return changePriceLabel
    }()
    
    
    // MARK: - Layout
    
    private func layout() {
        [nameLabel, priceLabel,  changePriceLabel].forEach { contentView.addSubview($0) }
        
        let safeIndent: CGFloat = 8
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 44),
            
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: safeIndent),
            
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -safeIndent),
            
            changePriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -safeIndent),
            changePriceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor)
        ])
    }
    
    
    // MARK: - Заполнение ячеек данными
    
    func pullCell(coinData: Coin) {
        nameLabel.text = coinData.coinName
        priceLabel.text = coinData.price
        changePriceLabel.text = coinData.changePrice
    }
}
