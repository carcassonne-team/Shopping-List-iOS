//
//  DashboardViewModel.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 04/05/2021.
//

import Foundation

protocol DashboardViewModelProtocol {
    var lists: [ListModel] { get set}
    func addListButtonDidTap()
    func listCellDidTap(list: ListModel)
    func fetchLists(completion: @escaping (() -> Void))
}

final class DashbaordViewModel: DashboardViewModelProtocol {
    private let provider = ListApiProvider()
    var lists: [ListModel] = []
    private weak var coordinator: DashboardViewControllerCoordinating?
   
    init(coordinator: DashboardViewControllerCoordinating) {
        self.coordinator = coordinator
    }
    
    func addListButtonDidTap() {
        coordinator?.showAddListViewController()
    }
//    anylisViewController
    func listCellDidTap(list: ListModel) {
        coordinator?.showListContnet(list: list)
        print(index)
    }
    
    func fetchLists(completion: @escaping (() -> Void)) {
        provider.moyaProvier.rx.request(.fetchList)
            .filterSuccessfulStatusCodes()
            .map([ListModel].self)
            .subscribe { [weak self] event in
                switch event {
                case let .success(response):
                    self?.lists = response
                    print(response)
                    completion()
                case let .error(error):
                    print(error.localizedDescription)
                }
            }
    }
}
