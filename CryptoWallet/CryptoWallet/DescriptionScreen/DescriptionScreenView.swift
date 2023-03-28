//
//  DescriptionScreenView.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 27.03.2023.
//

import UIKit

final class DescriptionScreen: UIView {
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UIObjects
    
    var image: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let change1HourText: UILabel = {
        let label = UILabel()
        label.text = "Изменение стоимости за последний час"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let changePriceLast1Hour: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let changePercentLast1Hour: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let change24HourText: UILabel = {
        let label = UILabel()
        label.text = "Изменение стоимости за последние сутки"
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let changePriceLast24Hour: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let changePercentLast24Hour: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Layout
    
    private func layout() {
        [image,
         nameLabel,
         symbolLabel,
         priceLabel,
         change1HourText,
         changePriceLast1Hour,
         changePercentLast1Hour,
         change24HourText,
         changePriceLast24Hour,
         changePercentLast24Hour].forEach { addSubview($0)}
        
        let safeIndent1: CGFloat = 16
        let safeIndent2: CGFloat = 8
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: safeIndent1),
            image.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: safeIndent1),
            nameLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: safeIndent2),
            symbolLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: safeIndent1),
            priceLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            change1HourText.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: safeIndent1),
            change1HourText.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            changePriceLast1Hour.topAnchor.constraint(equalTo: change1HourText.bottomAnchor, constant: safeIndent2),
            changePriceLast1Hour.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            
            changePercentLast1Hour.topAnchor.constraint(equalTo: change1HourText.bottomAnchor, constant: safeIndent2),
            changePercentLast1Hour.leadingAnchor.constraint(equalTo: changePriceLast1Hour.trailingAnchor),
            changePercentLast1Hour.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            changePercentLast1Hour.widthAnchor.constraint(equalTo: changePriceLast1Hour.widthAnchor),
            
            change24HourText.topAnchor.constraint(equalTo: changePercentLast1Hour.bottomAnchor, constant: safeIndent1),
            change24HourText.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            changePriceLast24Hour.topAnchor.constraint(equalTo: change24HourText.bottomAnchor, constant: safeIndent2),
            changePriceLast24Hour.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            
            changePercentLast24Hour.topAnchor.constraint(equalTo: change24HourText.bottomAnchor, constant: safeIndent2),
            changePercentLast24Hour.leadingAnchor.constraint(equalTo: changePriceLast24Hour.trailingAnchor),
            changePercentLast24Hour.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            changePercentLast24Hour.widthAnchor.constraint(equalTo: changePriceLast24Hour.widthAnchor)
        ])
    }
}
