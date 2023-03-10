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
    
    
    // MARK: - Layout
    
    private func layout() {
        [table, activityIndicator].forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            activityIndicator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            activityIndicator.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupScreen() {
        navigationItem.title = "Монеты"
        
        let barButtonSort = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: self, action: #selector(sortList))
        navigationItem.rightBarButtonItem = barButtonSort
        
        let barButtonLogOut = UIBarButtonItem(image: UIImage(systemName: "figure.walk.arrival"), style: .plain, target: self, action: #selector(logOut))
        navigationItem.leftBarButtonItem = barButtonLogOut
    }
}


// MARK: - Расширение UITableViewDataSource

extension ListScreenVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        #warning("указать колличество ячеек")
        3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as? CoinCell
        guard let cell = cell else { return UITableViewCell() }
        
//        cell.pullCell(coinData: <#T##<<error type>>#>)
        
        return cell
    }
}


// MARK: - Расширение UITableViewDelegate

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


// MARK: - Методы ListScreenVC

extension ListScreenVC {
    @objc private func sortList() {
        
    }
    
    private func showCoin(index: Int) {
        
    }
    
    @objc private func logOut() {
        RootVCManager.changeRootVC(VCType: LoginScreenVC())
    }
}
