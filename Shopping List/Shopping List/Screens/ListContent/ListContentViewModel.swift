//
//  ListContentViewModel.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 07/05/2021.
//

import Foundation

protocol ListContentViewModelProtocol {
    var currentList: ListModel { get }
    func addProductButtonDidTap()
}
 
final class ListContentViewModel: ListContentViewModelProtocol {
    private let coordinator: DashboardViewControllerCoordinating
    var currentList: ListModel
    private let provider = ListApiProvider()
    
    init(coordinator: DashboardViewControllerCoordinating,
         currentList: ListModel) {
        self.coordinator = coordinator
        self.currentList = currentList
    }
    
    func addProductButtonDidTap() {
        coordinator.showProductViewController(list: currentList)
    }
}
