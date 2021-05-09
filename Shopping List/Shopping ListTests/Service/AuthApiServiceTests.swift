//
//  AuthApiServiceTests.swift
//  Shopping ListTests
//
//  Created by Mateusz Leśniara on 09/05/2021.
//

import XCTest
import UIKit
@testable import Shopping_List

class AuthApiServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRegisterMethod() {
        let service = AuthApiService.self
        let login = service.register(parameters: RegisterParameters(name: "String", email: "String", password: "String", passwordConfirmation: "String"))
        XCTAssertEqual(login.method, .post, "Login should be post method")
    }

}

