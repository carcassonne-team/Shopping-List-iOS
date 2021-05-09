//
//  ListContentViewController.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 07/05/2021.
//

import UIKit

final class ListContentViewController: UIViewController {
    private let tableView = UITableView()
    private let viewModel: ListContentViewModelProtocol
    
    init(viewModel: ListContentViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    @objc func buttonAction(sender: UIButton!) {
        viewModel.addProductButtonDidTap()
    }
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonAction))
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        fetchList()
        view.addSubview(tableView)
        setupTableView()
        tableView.reloadData()
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
    
    private func fetchList() {
//        viewModel.fetchLists(completion: nil)
    }
}

extension ListContentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currentList.content?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCellWrapper<CategoryView> = tableView.dequeueCell(indexPath: indexPath)
        cell.view.update(text: viewModel.currentList.content?[indexPath.item].productName)
        
        return cell
    }
}

extension ListContentViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.listCellDidTap(index: indexPath.item)
    }
}

extension UITableView {
    func dequeueCell<T: CellIdentifiable>(indexPath: IndexPath) -> T {
        // swiftlint:disable:next force_cast
        return dequeueReusableCell(withIdentifier: T.cellIdentifier, for: indexPath) as! T
    }
}
