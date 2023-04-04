//
//  CryptoWalletTests.swift
//  CryptoWalletTests
//
//  Created by Рамиль Гирфанов on 04.04.2023.
//

import XCTest
@testable import CryptoWallet

final class CryptoWalletTests: XCTestCase {
    
    var account: AccountProtocol!
    var network: NetworkProtocol!
    var sorting: SortingProtocol!
    var loginViewModel: LoginVMProtocol!
    var listViewModel: ListVMProtocol!
    var sortingViewModel: SortingVMProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        account = Account()
        network = Network()
        sorting = Sorting()
        loginViewModel = LoginScreenVM(account: Models.account)
        listViewModel = ListScreenVM(network: Models.network,
                                     account: Models.account)
        sortingViewModel = SortingScreenVM(sorting: Models.sorting)
    }
    
    override func tearDownWithError() throws {
        account = nil
        network = nil
        sorting = nil
        loginViewModel = nil
        listViewModel = nil
        sortingViewModel = nil
        try super.tearDownWithError()
    }
    
    
    // MARK: - Account
    
    func testAccountEnteredStatusMustGetFalse() {
        let status = account.enteredStatus
        XCTAssertNotNil(status)
    }
    
    func testAccountEnteredStatusMustGetTrue() {
        account.enteredStatus = true
        let status = account.enteredStatus
        XCTAssertTrue(status)
    }
    
    func testAccountLoginMustGetString() {
        let login = account.login
        XCTAssertNotNil(login)
    }
    
    func testAccountPassMustGetString() {
        let password = account.password
        XCTAssertNotNil(password)
    }
    
    
    // MARK: - Network
    
    func testNetworkGetCoinsMustReturnCoinArray() {
        DispatchQueue(label: "TestForReturnCoinArray").sync {
            network.getCoins { coins in
                XCTAssertFalse(coins.isEmpty)
            }
        }
    }
    
    
    // MARK: - Sorting
    
    func testSortingTypesDontMustBeEmpty() {
        let sortingTypes = sorting.allTypesOfSorting
        
        XCTAssertFalse(sortingTypes.isEmpty)
    }
    
    
    // MARK: - LoginViewModel
    
    func testLoginVMLoginMustReturnTrue() {
        let loginStatus = loginViewModel.enter(login: "1234", pass: "1234")
        
        XCTAssertTrue(loginStatus)
    }
   
    
    // MARK: - ListViewModel
    
    func testListVMGetDataMustPullCoinArray() {
        listViewModel.updateView = { coins in
            XCTAssertFalse(coins.isEmpty)
        }
        
        listViewModel.getData()
    }
    

    // MARK: - SortingViewModel
    
    func testSortingVMMustGetSortingTypesAttay() {
        let sortingTypesArray = sortingViewModel.getSortingTypes()
        
        XCTAssertFalse(sortingTypesArray!.isEmpty)
    }
}
