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
    private enum Constants {
        static let name = "example"
        static let email = "example@example.com"
        static let password = "example@example.com"
        static let passwordConfirmation = "example@example.com"
        static let registerParameters = RegisterParameters(name: Constants.name,
                                                           email: Constants.email,
                                                           password: Constants.password,
                                                           passwordConfirmation: Constants.passwordConfirmation)
        static let loginParameters = LoginParameters(email: Constants.email,
                                                     password: Constants.password)
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRegisterMethod() {
        let service = AuthApiService.self
        let register = service.register(parameters: Constants.registerParameters)
        XCTAssertEqual(register.method, .post, "Register should be post method")
    }
    
    func testLoginMethod() {
        let service = AuthApiService.self
        let login = service.login(parameters: Constants.loginParameters)
        XCTAssertEqual(login.method, .post, "Login should be post method")
    }
    
    func testRegisterPath() {
        let service = AuthApiService.self
        let register = service.register(parameters: Constants.registerParameters)
        XCTAssertEqual(register.path, "/register", "Register should be post method")
    }
    
    func testLoginPath() {
        let service = AuthApiService.self
        let login = service.login(parameters: Constants.loginParameters)
        XCTAssertEqual(login.path, "/login", "Login should be post method")
    }
}
