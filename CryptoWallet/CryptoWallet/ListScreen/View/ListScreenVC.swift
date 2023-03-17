//
//  ListScreenVC.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 06.03.2023.
//

import UIKit

final class ListScreenVC: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layout()
        setupScreen()
        lisenViewModel()
    }
    
    // MARK: - UIObjects
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.register(CoinCell.self, forCellReuseIdentifier: CoinCell.identifier)
        table.separatorInset = .zero
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.isHidden = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    private let subViewForSort: UIView = {
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
    
    private lazy var firstSortButton: UIButton = {
        let button = UIButton()
        button.setTitle("Изменение цены за 24 часа", for: .normal)
        button.setTitleColor(commonColor, for: .normal)
        button.backgroundColor = .systemGray5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(firstSort), for: .touchUpInside)
        return button
    }()
    
    private lazy var secondSortButton: UIButton = {
        let button = UIButton()
        button.setTitle("Изменение цены за 1 час", for: .normal)
        button.setTitleColor(commonColor, for: .normal)
        button.backgroundColor = .systemGray5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(secondSort), for: .touchUpInside)
        return button
    }()
    
    private lazy var canselButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.setTitleColor(commonColor, for: .normal)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = commonCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cansel), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - ViewModel
    
    var viewModel: (VMProtocolIn & VMProtocolOut)?
#warning("исправить")
    
    
    // MARK: - Layout
    
    private func layout() {
        [table, activityIndicator, subViewForSort].forEach { view.addSubview($0) }
        
        [stack, canselButton].forEach { subViewForSort.addSubview($0)}
        
        [sortLabel, firstSortButton, secondSortButton].forEach {stack.addArrangedSubview($0)}
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            activityIndicator.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            subViewForSort.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            subViewForSort.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            subViewForSort.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
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
    
    
    // MARK: - Настройка экрана
    
    private func setupScreen() {
        navigationItem.title = "Монеты"
        
        let barButtonSort = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: self, action: #selector(sortList))
        navigationItem.rightBarButtonItem = barButtonSort
        
        let barButtonLogOut = UIBarButtonItem(image: UIImage(systemName: "figure.walk.arrival"), style: .plain, target: self, action: #selector(logOut))
        navigationItem.leftBarButtonItem = barButtonLogOut
    }
}


// MARK: - Методы ListScreenVC

extension ListScreenVC {
    @objc
    private func sortList() {
        subViewForSort.isHidden = false
    }
    
    @objc
    private func firstSort() {
        
    }
    
    @objc
    private func secondSort() {
        
    }
    
    @objc
    private func cansel() {
        subViewForSort.isHidden = true
    }
    
    @objc
    private func logOut() {
        RootVCManager.changeRootVC(VCType: .loginScreen)
        
        let enterStatus = false
        let key = UDEnterKeys.enterStatus.rawValue
        UserDefaults.standard.set(enterStatus, forKey: key)
    }
    
    private func showCoin(index: Int) {
#warning("указать колличество ячеек")
    }
    
    private func lisenViewModel() {
#warning("Настроить")
    }
}


// MARK: - Расширение UITableView

extension ListScreenVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
#warning("указать колличество ячеек")
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as? CoinCell
        guard let cell = cell else { return UITableViewCell() }
        
        //        cell.pullCell(coinData: <#T##<<error type>>#>)
        
        return cell
    }
}

extension ListScreenVC: UITableViewDelegate {
    //    Возвращает динамическую высоту ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    //    Обрабатывает нажатие на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showCoin(index: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
