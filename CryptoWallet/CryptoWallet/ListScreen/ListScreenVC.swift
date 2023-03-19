//
//  ListScreenVC.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 06.03.2023.
//

import UIKit

final class ListScreenVC: UIViewController {
    
    // MARK: - ViewModel
    private var viewModel: (ListVMProtocolIn & ListVMProtocolOut & LoginVMProtocol)?
    
    
    // MARK: - View
    private lazy var listScreen: ListScreen = {
        let listScreen = ListScreen()
        listScreen.table.dataSource = self
        listScreen.table.delegate = self
        return listScreen
    }()
    
    
    // MARK: - init
    init(viewModel: (ListVMProtocolIn & ListVMProtocolOut & LoginVMProtocol)) {
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
        addTargets()
        
        viewModel?.getData()
        lisenViewModel()
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
    
    private func addTargets() {
        listScreen.firstSortButton.addTarget(self,
                                             action: #selector(firstSort),
                                             for: .touchUpInside)
        
        listScreen.secondSortButton.addTarget(self,
                                              action: #selector(secondSort),
                                              for: .touchUpInside)
        
        listScreen.canselButton.addTarget(self,
                                          action: #selector(cansel),
                                          for: .touchUpInside)
    }
    
        
    private func showCoin(index: Int) {

    }
    
    private func lisenViewModel() {

    }
    
    private func stopActivityIndicator() {
        listScreen.activityIndicator.stopAnimating()
        listScreen.activityIndicator.isHidden = true
    }
}


// MARK: - Расширение UITableView

extension ListScreenVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
#warning("указать колличество ячеек")
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinCell.identifier, for: indexPath) as? CoinCell
        guard let cell = cell else { return UITableViewCell() }
        
        cell.pullCell()
        
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





// MARK: - @objc методы

extension ListScreenVC {
    @objc
    private func sortList() {
        listScreen.subViewForSort.isHidden = false
    }
    
    @objc
    private func firstSort() {
        
    }
    
    @objc
    private func secondSort() {
        
    }
    
    @objc
    private func cansel() {
        listScreen.subViewForSort.isHidden = true
    }
    
    @objc
    private func logOut() {
        viewModel?.out()
    }
}
