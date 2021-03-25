//
//  LoginCoordinator.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 17/03/2021.
//

import UIKit

protocol LoginCoordinatorProtocol: CoordinatorProtocol { }
 
final class LoginCoordinator: LoginCoordinatorProtocol {
    var type: CoordinatorType { .login }
    var linkedCoordinators = LinkedCoordinators()
    func start() {
    }
}
