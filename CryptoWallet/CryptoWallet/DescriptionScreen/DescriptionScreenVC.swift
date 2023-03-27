//
//  DescriptionScreenVC.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 10.03.2023.
//

import UIKit

final class DescriptionScreenVC: UIViewController {
    
    // MARK: - ViewModel
    
    private var viewModel: DescriptionVMProtokol?
    
    
    // MARK: - View
    
    private let descriptionScreen = DescriptionScreen()
    
    
    // MARK: - init
    
    init(viewModel: DescriptionVMProtokol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = descriptionScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let coin = viewModel?.getCoin()
        setupData(coin: coin)
    }
    
    private func setupData(coin: Coin?) {
        if let image = coin?.imageData {
            descriptionScreen.image.image = UIImage(data: image)
        }
        
        if let name = coin?.name {
            descriptionScreen.nameLabel.text = name
        } else {
            descriptionScreen.nameLabel.text = "Данных нет"
        }
        
        if let symbol = coin?.symbol {
            descriptionScreen.symbolLabel.text = symbol
        } else {
            descriptionScreen.symbolLabel.text = "Данных нет"
        }
        
        if let priceString = coin?.priceString {
            descriptionScreen.priceLabel.text = "$" + priceString
        } else {
            descriptionScreen.priceLabel.text = "Данных нет"
        }
        
        if let changePriceLast1HourString = coin?.changePriceLast1HourString {
            descriptionScreen.changePriceLast1Hour.text = "$" + changePriceLast1HourString
        } else {
            descriptionScreen.changePriceLast1Hour.text = "Данных нет"
        }
        
        if let changePercentLast1HourString = coin?.changePercentLast1HourString {
            descriptionScreen.changePercentLast1Hour.text = "(" + changePercentLast1HourString + "%" + ")"
        } else {
            descriptionScreen.changePercentLast1Hour.text = "Данных нет"
        }
        
        if let changePriceLast24HourString = coin?.changePriceLast24HourString {
            descriptionScreen.changePriceLast24Hour.text = "$" + changePriceLast24HourString
        } else {
            descriptionScreen.changePriceLast24Hour.text = "Данных нет"
        }
        
        if let changePercentLast24HourString = coin?.changePercentLast24HourString {
            descriptionScreen.changePercentLast24Hour.text = "(" + changePercentLast24HourString + "%" + ")"
        } else {
            descriptionScreen.changePercentLast24Hour.text = "Данных нет"
        }
    }
}
