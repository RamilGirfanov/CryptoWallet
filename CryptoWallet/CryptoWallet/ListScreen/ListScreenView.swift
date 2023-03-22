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
    
    let subViewForSort: UIView = {
        let subViewForSort = UIView()
        subViewForSort.backgroundColor = .clear
        subViewForSort.layer.cornerRadius = commonCornerRadius
        subViewForSort.translatesAutoresizingMaskIntoConstraints = false
        subViewForSort.isHidden = true
        return subViewForSort
    }()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 2
        stack.backgroundColor = .systemGray4
        stack.layer.cornerRadius = commonCornerRadius
        stack.clipsToBounds = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let sortLabel: UILabel = {
        let label = UILabel()
        label.text = "Сортировка"
        label.textColor = .secondaryLabel
        label.backgroundColor = .systemGray5
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstSortButton: UIButton = {
        let button = UIButton()
        button.setTitle("Изменение цены за 24 часа", for: .normal)
        button.setTitleColor(commonColor, for: .normal)
        button.backgroundColor = .systemGray5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let secondSortButton: UIButton = {
        let button = UIButton()
        button.setTitle("Изменение цены за 1 час", for: .normal)
        button.setTitleColor(commonColor, for: .normal)
        button.backgroundColor = .systemGray5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let canselButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.setTitleColor(commonColor, for: .normal)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = commonCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // MARK: - Layout
    
    private func layout() {
        [table, activityIndicator, subViewForSort].forEach { addSubview($0) }
        
        [stack, canselButton].forEach { subViewForSort.addSubview($0)}
        
        [sortLabel, firstSortButton, secondSortButton].forEach {stack.addArrangedSubview($0)}
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.topAnchor.constraint(equalTo: topAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: leadingAnchor),
            activityIndicator.trailingAnchor.constraint(equalTo: trailingAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            subViewForSort.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            subViewForSort.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            subViewForSort.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            sortLabel.heightAnchor.constraint(equalToConstant: commonHeighTapObjects / 1.5),
            firstSortButton.heightAnchor.constraint(equalToConstant: commonHeighTapObjects),
            secondSortButton.heightAnchor.constraint(equalToConstant: commonHeighTapObjects),
            canselButton.heightAnchor.constraint(equalToConstant: commonHeighTapObjects),
            
            stack.topAnchor.constraint(equalTo: subViewForSort.topAnchor),
            stack.leadingAnchor.constraint(equalTo: subViewForSort.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: subViewForSort.trailingAnchor),
            
            canselButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 8),
            canselButton.leadingAnchor.constraint(equalTo: subViewForSort.leadingAnchor),
            canselButton.trailingAnchor.constraint(equalTo: subViewForSort.trailingAnchor),
            canselButton.bottomAnchor.constraint(equalTo: subViewForSort.bottomAnchor)
        ])
    }
}
