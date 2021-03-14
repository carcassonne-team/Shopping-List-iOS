//
//  MainCoordinator.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 14/03/2021.
//

import UIKit

protocol MainCoordinatorProtocol: CoordinatorProtocol { }

final class MainCoordinator: MainCoordinatorProtocol {
    private let navigation: UINavigationController
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    var childCoordinators = [CoordinatorProtocol]()
    
    func start() {
        let viewController = StartScreenViewController()
        navigation.setNavigationBarHidden(true, animated: false)
        navigation.setViewControllers([viewController], animated: false)
    }
    
    func didFinish(with child: CoordinatorProtocol?) {
        childCoordinators.removeAll() { $0 === child }
    }
}
