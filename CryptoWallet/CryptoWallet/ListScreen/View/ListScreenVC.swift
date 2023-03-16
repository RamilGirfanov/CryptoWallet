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
        subViewForSort.translatesAutoresizingMaskIntoConstraints = false
        return subViewForSort
    }()
    
    private var subViewHeightConstreint = NSLayoutConstraint()
    
    private lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    private let viewForSortButton: UIView = {
        let viewForSortButton = UIView()
        viewForSortButton.backgroundColor = .systemGray4
        viewForSortButton.translatesAutoresizingMaskIntoConstraints = false
        viewForSortButton.isHidden = true
        return viewForSortButton
    }()
    
    private let enterButton: UIButton = {
        let enterButton = UIButton()
        enterButton.setTitle("Готово", for: .normal)
        enterButton.backgroundColor = commonColor
        enterButton.layer.cornerRadius = commonCornerRadius
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.isHidden = true
        return enterButton
    }()
    
    
    // MARK: - Layout
    
    private func layout() {
        [table, activityIndicator, subViewForSort].forEach { view.addSubview($0) }
        
        subViewHeightConstreint = subViewForSort.heightAnchor.constraint(equalToConstant: 0)

        [picker, viewForSortButton, enterButton].forEach { subViewForSort.addSubview($0)}
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            activityIndicator.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            subViewHeightConstreint,
            subViewForSort.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            subViewForSort.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            subViewForSort.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            picker.leadingAnchor.constraint(equalTo: subViewForSort.leadingAnchor),
            picker.trailingAnchor.constraint(equalTo: subViewForSort.trailingAnchor),
            picker.bottomAnchor.constraint(equalTo: subViewForSort.bottomAnchor),
            
            viewForSortButton.heightAnchor.constraint(equalToConstant: 44),
            viewForSortButton.topAnchor.constraint(equalTo: subViewForSort.topAnchor),
            viewForSortButton.leadingAnchor.constraint(equalTo: subViewForSort.leadingAnchor),
            viewForSortButton.trailingAnchor.constraint(equalTo: subViewForSort.trailingAnchor),
            viewForSortButton.bottomAnchor.constraint(equalTo: picker.topAnchor),
            
            enterButton.widthAnchor.constraint(equalToConstant: 88),
            enterButton.topAnchor.constraint(equalTo: viewForSortButton.topAnchor, constant: 8),
            enterButton.trailingAnchor.constraint(equalTo: viewForSortButton.trailingAnchor, constant: -8),
            enterButton.bottomAnchor.constraint(equalTo: viewForSortButton.bottomAnchor, constant: -8)
        ])
    }
    
    
    // MARK: - Настройка экрана
    
    private func setupScreen() {
        navigationItem.title = "Монеты"
        
        let barButtonSort = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: self, action: #selector(sortList))
        navigationItem.rightBarButtonItem = barButtonSort
        
        let barButtonLogOut = UIBarButtonItem(image: UIImage(systemName: "figure.walk.arrival"), style: .plain, target: self, action: #selector(logOut))
        navigationItem.leftBarButtonItem = barButtonLogOut
        
        enterButton.addTarget(self, action: #selector(enter), for: .touchUpInside)
    }
}


// MARK: - Методы ListScreenVC

extension ListScreenVC {
    @objc
    private func sortList() {
        subViewHeightConstreint.constant = 250
        viewForSortButton.isHidden = false
        enterButton.isHidden = false
    }
    
    @objc
    private func enter() {
        subViewHeightConstreint.constant = 0
        viewForSortButton.isHidden = true
        enterButton.isHidden = true
    }
    
    @objc
    private func logOut() {
        RootVCManager.changeRootVC(VCType: LoginScreenVC())
        
        let enterStatus = false
        let key = UDEnterKeys.enterStatus.rawValue
        UserDefaults.standard.set(enterStatus, forKey: key)
    }
    
    private func showCoin(index: Int) {
        
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

// MARK: - Расширение UIPickerView

extension ListScreenVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        2
    }
}

extension ListScreenVC: UIPickerViewDelegate {
    
}
