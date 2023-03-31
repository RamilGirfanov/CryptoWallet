//
//  ListScreenVC.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 06.03.2023.
//

import UIKit

final class ListScreenVC: UIViewController {
    
    // MARK: - ViewModel
    
    private var viewModel: (ListVMProtocol & LoginVMProtocol)?
    
    // Массив для обновления tableView
    private var coinArray: [Coin] = []
    
    
    // MARK: - View
    
    private lazy var listScreen: ListScreen = {
        let listScreen = ListScreen()
        listScreen.table.dataSource = self
        listScreen.table.delegate = self
        return listScreen
    }()
    
    
    // MARK: - init
    
    init(viewModel: (ListVMProtocol & LoginVMProtocol)) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = listScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        
        viewModel?.getData()
        viewModel?.updateView = { [weak self] coinArray in
            guard let self = self else { return }
            self.coinArray = coinArray
            self.updateView()
        }
    }
    
    
    // MARK: - Настройка экрана
    
    private func setupScreen() {
        navigationItem.title = "Монеты"
        
        let barButtonSort = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(sortList))
        
        navigationItem.rightBarButtonItem = barButtonSort
        
        let barButtonLogOut = UIBarButtonItem(image: UIImage(systemName: "figure.walk.arrival"),
                                              style: .plain,
                                              target: self,
                                              action: #selector(logOut))
        
        navigationItem.leftBarButtonItem = barButtonLogOut
    }
}


// MARK: - Функционал

extension ListScreenVC {
    
    private func showCoin(index: Int) {
        let coin = coinArray[index]
        let descriptionVM = DescriptionScreenVM(coin: coin)
        let descriptionVC = DescriptionScreenVC(viewModel: descriptionVM)
        
        present(descriptionVC, animated: true)
    }
    
    
    private func updateView() {
        DispatchQueue.main.async {
            self.listScreen.table.reloadData()
            self.listScreen.activityIndicator.stopAnimating()
            self.listScreen.activityIndicator.isHidden = true
        }
    }
    
    // Вызов экрана выбора сортировки
    @objc
    private func sortList() {
        let sortingScreenVM = SortingScreenVM()
        sortingScreenVM.passSortingType = { [weak self] type in
            guard let self = self else { return }
            self.viewModel?.sortCoins(sortType: type)
        }
        
        let sortingScreenVC = SortingScreenVC(viewModel: sortingScreenVM)
        
        sortingScreenVC.modalPresentationStyle = .popover
        
        guard let presentationVC = sortingScreenVC.popoverPresentationController else { return }
        presentationVC.delegate = self
        presentationVC.sourceView = listScreen.table
        presentationVC.permittedArrowDirections = .up
        presentationVC.sourceRect = CGRect(x: listScreen.table.bounds.maxX,
                                           y: listScreen.table.bounds.minY,
                                           width: 0,
                                           height: 0)
        
        present(sortingScreenVC, animated: true)
    }
    
    @objc
    private func logOut() {
        viewModel?.out()
    }
}


// MARK: - Расширение UITableView

extension ListScreenVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coinArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as? CoinCell
        guard let cell = cell else { return UITableViewCell() }
        
        cell.pullCell(coin: coinArray[indexPath.row])
        
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
