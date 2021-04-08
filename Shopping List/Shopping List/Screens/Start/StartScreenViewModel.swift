//
//  StartScreenViewModel.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 14/03/2021.
//

import UIKit

protocol StartScreenViewModelProtocol {
    func loginButtonDidTap()
    func registrationButtonDidTap()
}

final class StartScreenViewModel: StartScreenViewModelProtocol {
    private weak var coordinator: StartScreenViewControllerCoordinating?
    
    init(coordinator: StartScreenViewControllerCoordinating) {
        self.coordinator = coordinator
    }
    
    func loginButtonDidTap() {
        coordinator?.showLoginViewController()
    }
    
    func registrationButtonDidTap() {
        coordinator?.showRegistrationViewController()
    }
}
