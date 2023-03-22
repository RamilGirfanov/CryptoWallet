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
    
    private let firstStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 2
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let coinImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let secontStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.text = "Название"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Цена"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let change1hPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "За 1ч: "
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let change24hPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "За 24ч: "
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    // MARK: - Layout
    
    private func layout() {
        contentView.addSubview(firstStack)
        
        [coinImage, secontStack].forEach { firstStack.addArrangedSubview($0)}
        
        [symbolLabel, priceLabel, change1hPriceLabel, change24hPriceLabel].forEach { secontStack.addArrangedSubview($0)}
                
        let safeIndent: CGFloat = 8
        
        NSLayoutConstraint.activate([
            coinImage.heightAnchor.constraint(equalTo: firstStack.heightAnchor),
            coinImage.widthAnchor.constraint(equalTo: coinImage.heightAnchor),
            
            firstStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: safeIndent),
            firstStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: safeIndent),
            firstStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -safeIndent),
            firstStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -safeIndent),
        ])
    }
    
    
    // MARK: - Заполнение ячеек данными
    #warning("Изменить")
    func pullCell(coin: Coin) {
        
        if let imageData = coin.imageData {
            coinImage.image = UIImage(data: imageData)
        }
        
        symbolLabel.text = coin.symbol
        priceLabel.text = coin.priceUsdString
        change1hPriceLabel.text = coin.changeUsdLast1HourString
        change24hPriceLabel.text = coin.changeUsdLast24HoursString
    }
}
