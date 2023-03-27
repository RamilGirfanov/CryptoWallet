//
//  ListScreenView.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 19.03.2023.
//

import UIKit

final class ListScreen: UIView {
    
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
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.register(CoinCell.self, forCellReuseIdentifier: CoinCell.identifier)
        table.separatorInset = .zero
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.9)
        activityIndicator.style = .large
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    
    // MARK: - Layout
    
    private func layout() {
        [table, activityIndicator].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            activityIndicator.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
