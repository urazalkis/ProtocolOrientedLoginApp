//
//  ProtocolOrientedLoginAppTests.swift
//  ProtocolOrientedLoginAppTests
//
//  Created by Uraz Alkış on 29.04.2023.
//

import XCTest
@testable import ProtocolOrientedLoginApp
private var viewModel : RootViewModel!
private var loginStorageService : MockLoginStorageService!
private var output : MockRootViewModelOutput!

final class ProtocolOrientedLoginAppTests: XCTestCase {

    override func setUpWithError() throws {
        loginStorageService = MockLoginStorageService()
        viewModel = RootViewModel(loginStorageService: loginStorageService)
        output = MockRootViewModelOutput()
        viewModel.output = output
    }
    override func tearDownWithError() throws {
        viewModel = nil
        loginStorageService  = nil
    }

    func testShowLogin_whenLoginStorageReturnsEmptyUserAccessToken() throws {
        loginStorageService.storage = [:]
        viewModel.checkLogin()
        XCTAssertEqual(output.checkArray.first, .login)
    }
    func testShowMain_whenLoginStorageReturnsUserAccessToken() throws {
        loginStorageService.storage["ACCESS_TOKEN"] = "TOKEN"
        viewModel.checkLogin()
        XCTAssertEqual(output.checkArray.first, .mainApp)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
class MockLoginStorageService : LoginStorageService{
    var userAccessTokenKey: String {
        return "ACCESS_TOKEN"
    }
    var storage : [String:String] = [:]
    func setUserAccess(token: String) {
        storage[userAccessTokenKey] = token
    }
    
    func getUserAccessToken() -> String? {
        return storage[userAccessTokenKey]
    }
    
}
class MockRootViewModelOutput : RootViewModelOutput{
    enum Check {
        case login
        case mainApp
    }
    var checkArray:[Check] = []
    func showLogin() {
        checkArray.append(.login)
    }
    
    func showMainApp() {
        checkArray.append(.mainApp)
    }
    
    
    
}
