//
//  RegistrationViewModel.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 15/04/2021.
//

import Foundation

protocol RegistrationViewModelProtocol {
    func registerButtonDidTap()
}

final class RegistrationViewModel: RegistrationViewModelProtocol {
    private weak var coordinator: RegistrationViewControllerCoordinating?
    
    init(coordinator: RegistrationViewControllerCoordinating) {
        self.coordinator = coordinator
    }
    
    func registerButtonDidTap() {
        coordinator?.showLoginViewController()
    }
}
