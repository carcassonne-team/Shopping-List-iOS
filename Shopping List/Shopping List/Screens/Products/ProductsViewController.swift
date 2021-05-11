//
//  ProductsViewController.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 08/05/2021.
//

import Foundation
import UIKit

final class ProductsViewController: UIViewController {
    private let tableView = UITableView()
    private let viewModel: ProductsViewModelProtocol
    
    init(viewModel: ProductsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        view.addSubview(tableView)
        setupTableView()
        tableView.reloadData()
        fetchProducts()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(for: TableViewCellWrapper<CategoryView>.self)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(20)
        }
    }
    
    private func fetchProducts() {
        viewModel.fetchProducts(completion: { [weak self] in
            self?.tableView.reloadData()
        })
    }
}

extension ProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCellWrapper<CategoryView> = tableView.dequeueCell(indexPath: indexPath)
        cell.view.update(text: viewModel.products[indexPath.item].name)
        
        return cell
    }
}

extension ProductsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.addProductButtonDidTap(productId: viewModel.products[indexPath.item].id ?? 0)
    }
}
