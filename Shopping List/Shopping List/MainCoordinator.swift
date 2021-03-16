//
//  MainCoordinator.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 14/03/2021.
//

import UIKit

protocol MainCoordinatorProtocol: CoordinatorProtocol, StartScreenViewControllerCoordinating { }

protocol StartScreenViewControllerCoordinating {
    func showLoginViewController()
    func showRegistrationViewController()
}

final class MainCoordinator: MainCoordinatorProtocol {
    private var childCoordinators = [CoordinatorProtocol]()
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let viewController = StartScreenViewController(viewModel: StartScreenViewModel(coordinator: self))
        navigation.setNavigationBarHidden(true, animated: false)
        navigation.setViewControllers([viewController], animated: false)
    }
    
    func didFinish(with child: CoordinatorProtocol?) {
        childCoordinators.removeAll { $0 === child }
    }
    
    func showLoginViewController() {
    }
    
    func showRegistrationViewController() {
    }
}
