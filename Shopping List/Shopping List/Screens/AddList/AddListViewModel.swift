//
//  AddListViewModel.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 05/05/2021.
//

import Foundation
import Moya

protocol AddListViewModelProtocol {
    func addListButtonDidTap(name: CreateParameters)
}

final class AddListViewModel: AddListViewModelProtocol {
    private let coordinator: DashboardViewControllerCoordinating
    private let provider = ListApiProvider()
    
    init(coordinator: DashboardViewControllerCoordinating) {
        self.coordinator = coordinator
    }
    
    func addListButtonDidTap(name: CreateParameters) {
        provider.moyaProvier.rx.request(.createList(parameters: name))
            .subscribe { event in
                switch event {
                case let .success(response):
                    let data = response.data
                    print(data)
                case let .error(error):
                    print(error.localizedDescription)
                }
            }
    }
}
