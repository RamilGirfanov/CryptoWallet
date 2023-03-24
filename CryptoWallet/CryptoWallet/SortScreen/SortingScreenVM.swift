//
//  SortingScreenVM.swift
//  CryptoWallet
//
//  Created by Рамиль Гирфанов on 24.03.2023.
//

import Foundation

final class SortingScreenVM: SortingVMProtocol {
    
    // MARK: - Model

    private let sorting = Sorting()
    
    
    // MARK: - VMProcol

    func getSortingTypes() -> [Sorting.SortingTypes] {        
        return sorting.allTypesOfSorting
    }
    
    var passSortingType: (Sorting.SortingTypes) -> Void = { _ in }
}
