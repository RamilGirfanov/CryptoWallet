//
//  ListScreenVC.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 06.03.2023.
//

import UIKit

final class ListScreenVC: UIViewController {
    // MARK: - Экземпляр ListScreen
    
    private lazy var listScreen: ListScreen = {
        let listScreen = ListScreen()
        listScreen.table.dataSource = self
        listScreen.table.delegate = self
        return listScreen
    }()
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = listScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
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
        #warning("указать колличество ячеек")
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as? CoinCell
        guard let cell = cell else { return UITableViewCell() }
        
        cell.pullCell(coinData: <#T##<<error type>>#>)
        
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
        
    }
}
