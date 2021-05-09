//
//  MainCoordinator.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 14/03/2021.
//

import UIKit

protocol MainCoordinatorProtocol: CoordinatorProtocol, StartScreenViewControllerCoordinating { }

protocol StartScreenViewControllerCoordinating: AnyObject {
    func showDashboardViewController()
    func showRegistrationViewController()
}

protocol RegistrationViewControllerCoordinating: AnyObject {
    func showLoginViewController()
}

protocol DashboardViewControllerCoordinating: AnyObject {
    func showListContnet(list: ListModel)
    func showAddListViewController()
    func showProductViewController(list: ListModel)
}

protocol AddListViewControllerCoordinating: AnyObject {
}

final class MainCoordinator: MainCoordinatorProtocol, RegistrationViewControllerCoordinating {
    private var childCoordinators = [CoordinatorProtocol]()
    private let navigation: UINavigationController
    var type: CoordinatorType { .app }
    var linkedCoordinators = LinkedCoordinators()
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let viewController = StartScreenViewController(viewModel: StartScreenViewModel(coordinator: self))
        navigation.setNavigationBarHidden(true, animated: false)
        navigation.setViewControllers([viewController], animated: false)
    }
    
    func showDashboardViewController() {
        let dashboardCoordinator = DashboardCoordinator(navigation: navigation)
//        dashboardCoordinator.start()
        coordinate(to: dashboardCoordinator)
    }
    
    func showLoginViewController() {
        
    }
    
    func showRegistrationViewController() {
        let viewController = RegistrationViewController(viewModel: RegistrationViewModel(coordinator: self))
        let navigationController = UINavigationController(rootViewController: viewController)
        navigation.present(navigationController, animated: true)
    }
}
