//
//  DashboardCoordinator.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 17/03/2021.
//

import UIKit

protocol DashboardCoordinatorProtocol: CoordinatorProtocol { }

final class DashboardCoordinator: DashboardCoordinatorProtocol,
                                  DashboardViewControllerCoordinating {
    private let navigation: UINavigationController
    var type: CoordinatorType { .dashboard }
    var linkedCoordinators = LinkedCoordinators()
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let viewController = DashboardViewController(viewModel: DashbaordViewModel(coordinator: self))
        navigation.setNavigationBarHidden(false, animated: false)
        navigation.setViewControllers([viewController], animated: false)
    }
    
    func showListContnet(list: ListModel) {
        let viewController = ListContentViewController(viewModel: ListContentViewModel(coordinator: self, currentList: list))
        navigation.setNavigationBarHidden(false, animated: false)
        navigation.pushViewController(viewController, animated: false)
    }
    
    func showProductViewController(list: ListModel) {
        let viewController = ProductsViewController(viewModel: ProductsViewModel(coordinator: self, currentList: list))
        navigation.setNavigationBarHidden(false, animated: false)
        navigation.pushViewController(viewController, animated: false)
    }
    
    func showAddListViewController() {
        let viewController = AddListViewController(viewModel: AddListViewModel(coordinator: self))
        navigation.setNavigationBarHidden(false, animated: false)
        navigation.pushViewController(viewController, animated: false)
    }
}
