//
//  SortingScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 24.03.2023.
//

import Foundation

final class SortingScreenVM: SortingVMProtocol {
    
    // MARK: - Model
    
    private let sorting: Sorting?
    
    
    // MARK: - init
    
    init(sorting: Sorting) {
        self.sorting = sorting
    }
    
    
    // MARK: - SortingVMProtocol
    
    func getSortingTypes() -> [SortingTypes]? {        
        sorting?.allTypesOfSorting
    }
    
    var passSortingType: (SortingTypes) -> Void = { _ in }
}
