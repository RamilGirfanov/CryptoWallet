//
//  SortingCell.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 24.03.2023.
//

import UIKit

final class SortingCell: UITableViewCell {
    
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
    
    private let sortNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - Layout
    
    private func layout() {
        contentView.addSubview(sortNameLabel)
        
        NSLayoutConstraint.activate([
            sortNameLabel.heightAnchor.constraint(equalToConstant: GeneralProperties.heighTapObjects),
            sortNameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            sortNameLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            sortNameLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            sortNameLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    // MARK: - Заполнение ячеек данными
    
    func pullCell(sortName: String) {
        sortNameLabel.text = sortName
    }
}
