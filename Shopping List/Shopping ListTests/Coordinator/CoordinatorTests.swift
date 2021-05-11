//
//  CoordinatorTests.swift
//  Shopping ListTests
//
//  Created by Mateusz Leśniara on 11/05/2021.
//

import XCTest
import UIKit
@testable import Shopping_List

class CoordinatorTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
}
