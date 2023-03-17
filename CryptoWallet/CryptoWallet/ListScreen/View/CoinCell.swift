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
//        image.layer.cornerRadius = coinImage.frame.size.height / 2
//        image.clipsToBounds = true
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
    /*
    private let thridStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 2
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "distribute.horizontal.center")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let fourthStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    */
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
    func pullCell() {
        let fakeCoin = FakeCoin()
        
        coinImage.image = fakeCoin.image
        symbolLabel.text = fakeCoin.symbol
        priceLabel.text = "$\(fakeCoin.price)"
        change1hPriceLabel.text = "Изменение цены за 1ч: \(fakeCoin.cange1h)"
        change24hPriceLabel.text = "Изменение цены за 24ч: \(fakeCoin.cange24h)"
        
        
//        nameLabel.text = coinData.coinName
//        priceLabel.text = coinData.price
//        changePriceLabel.text = coinData.changePrice
    }
}
