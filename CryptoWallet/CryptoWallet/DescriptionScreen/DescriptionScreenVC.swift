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
        descriptionScreen.setupData(coin: coin)
    }
}
