//
//  StartScreenViewModel.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 14/03/2021.
//

import UIKit
import SnapKit
import RxMoya
import Moya
import KeychainSwift

protocol StartScreenViewModelProtocol {
    func loginButtonDidTap(loginParameters: LoginParameters)
    func registrationButtonDidTap()
}

final class StartScreenViewModel: StartScreenViewModelProtocol {
    private weak var coordinator: StartScreenViewControllerCoordinating?
    let provider = MoyaProvider<AuthApiService>()
    let keychain = KeychainSwift()
    
    init(coordinator: StartScreenViewControllerCoordinating) {
        self.coordinator = coordinator
    }
    
    func loginButtonDidTap(loginParameters: LoginParameters) {
        provider.rx.request(.login(parameters: loginParameters))
            .filterSuccessfulStatusCodes()
            .map(TokenInfo.self)
            .subscribe { [weak self] event in
                switch event {
                case let .success(response):
                    let token = response.token
                    self?.keychain.set(token ?? "", forKey: "token")
                    self?.coordinator?.showDashboardViewController()
                case let .error(error):
                    print(error)
                }
            }
    }
    
    func registrationButtonDidTap() {
        coordinator?.showRegistrationViewController()
    }
}
