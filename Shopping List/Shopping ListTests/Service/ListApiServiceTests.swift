//
//  ListApiServiceTests.swift
//  Shopping ListTests
//
//  Created by Mateusz Leśniara on 09/05/2021.
//

import XCTest
import UIKit
@testable import Shopping_List

class ListApiServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testDashboardCoordinatorType() {
        let navigationController = UINavigationController()
        let coordinator = DashboardCoordinator(navigation: navigationController)
        XCTAssertEqual(coordinator.type, CoordinatorType.dashboard, "Coordinator type must be dashboard")
    }
    
    func testMainCoordinatorType() {
        let navigationController = UINavigationController()
        let coordinator = MainCoordinator(navigation: navigationController)
        XCTAssertEqual(coordinator.type, CoordinatorType.app, "Coordinator type must be app")
    }
    
    func testAuthApiService() {
        let service = AuthApiService.self
        let login = service.login(parameters: LoginParameters(email: "String", password: "String"))
        XCTAssertEqual(login.method, .post, "Login should be post method")
    }
    
    func testAddProductRequest() {
        let service = ListContentService.self
        let login = service.addProduct(parameters: AddParameters(productListId: 0, productId: 0))
        XCTAssertEqual(login.method, .post, "Add should be post method")
    }
    
    func testFetchListProdcuts() {
        let service = ProductListsService.self
        let login = service.fetchList
        XCTAssertEqual(login.method, .get, "Fetch should be get method")
    }
    
    func testAddListProdcuts() {
        let service = ProductListsService.self
        let login = service.createList(parameters: CreateParameters(name: "String"))
        XCTAssertEqual(login.method, .post, "Create should be post method")
    }
    
    func testAProdcuts() {
        let service = ProductListsService.self
        let login = service.deleteList(parameters: DeleteParameters(id: ""))
        XCTAssertEqual(login.method, .delete, "Delete should be post method")
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

