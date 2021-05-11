//
//  ProductsViewModel.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 08/05/2021.
//

import Foundation
import Moya
import RxSwift

protocol ProductsViewModelProtocol {
    var products: [ProductModel] { get set }
    var currentList: ListModel { get }
    func addProductButtonDidTap(productId: Int)
    func fetchProducts(completion: @escaping (() -> Void))
}
 
final class ProductsViewModel: ProductsViewModelProtocol {
    private let coordinator: DashboardViewControllerCoordinating
    var products: [ProductModel] = []
    var currentList: ListModel
    private let productsProvider = ProductsApiProvider()
    private let listsProvider = ListContentApiProvider()
    private let disposeBag = DisposeBag()
    
    init(coordinator: DashboardViewControllerCoordinating,
         currentList: ListModel) {
        self.coordinator = coordinator
        self.currentList = currentList
    }
    
    func addProductButtonDidTap(productId: Int) {
        listsProvider.moyaProvier.rx.request(.addProduct(parameters: AddParameters(productListId: currentList.id ?? 0, productId: productId)))
            .subscribe { event in
                switch event {
                case let .success(response):
                  print(response.statusCode)
                case let .error(error):
                    print(error.localizedDescription)
                }
            }.disposed(by: disposeBag)
    }
     
    func fetchProducts(completion: @escaping (() -> Void)) {
        productsProvider.moyaProvier.rx.request(.fetchProducts)
            .filterSuccessfulStatusCodes()
            .map([ProductModel].self)
            .subscribe { [weak self] event in
                switch event {
                case let .success(response):
                    self?.products = response
                    print(response)
                    completion()
                case let .error(error):
                    print(error.localizedDescription)
                }
            }.disposed(by: disposeBag)
    }
}
