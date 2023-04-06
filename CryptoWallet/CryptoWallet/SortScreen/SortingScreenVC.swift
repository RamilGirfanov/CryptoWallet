//
//  SortingScreenVC.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 24.03.2023.
//

import UIKit

final class SortingScreenVC: UIViewController {
    
    // MARK: - ViewModel
    
    private var viewModel: SortingVMProtocol?
    
    
    // MARK: - View
    
    private lazy var sortScreen: SortingScreen = {
        let sortScreen = SortingScreen()
        sortScreen.table.dataSource = self
        sortScreen.table.delegate = self
        return sortScreen
    }()
    
    
    // MARK: - init
    
    init(viewModel: SortingVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = sortScreen
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        preferredContentSize = CGSize(width: sortScreen.table.contentSize.width,
                                      height: sortScreen.table.contentSize.height)
    }
}


// MARK: - Расширения UITableView

extension SortingScreenVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getSortingTypes()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SortingCell.identifier, for: indexPath) as? SortingCell
        guard let cell = cell else {
            return UITableViewCell()
        }
        
        if let sortingTypes = viewModel?.getSortingTypes() {
            var types: [String] = []
            
            sortingTypes.forEach { type in
                types.append(type.rawValue)
            }
            
            cell.pullCell(sortName: types[indexPath.row])
        }
        
        return cell
    }
}

extension SortingScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let types = viewModel?.getSortingTypes() {
            let type = types[indexPath.row]
            viewModel?.passSortingType(type)
            dismiss(animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
