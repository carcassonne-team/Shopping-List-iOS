//
//  Dashboard.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 22/04/2021.
//

import UIKit

final class DashboardViewController: UIViewController {
    private let tableView = UITableView()
    private let viewModel: DashboardViewModelProtocol
    private let refreshControl = UIRefreshControl()
    
    init(viewModel: DashboardViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        viewModel.addListButtonDidTap()
    }
    
    @objc func deleteButtonAction(seneder: UIButton!) {
        print("usuwa")
    }
    
    @objc func pullToRefreshAction(_ sender: AnyObject) {
        viewModel.fetchLists(completion: { [weak self] in
            self?.tableView.reloadData()
            self?.refreshControl.endRefreshing()
        })
    }
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonAction))
        commonInit()
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        fetchList()
        view.addSubview(tableView)
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(pullToRefreshAction(_:)), for: .valueChanged)
        tableView.registerCell(for: TableViewCellWrapper<CategoryView>.self)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func fetchList() {
        viewModel.fetchLists(completion: { [weak self] in
            self?.tableView.reloadData()
        })
    }
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCellWrapper<CategoryView> = tableView.dequeueCell(indexPath: indexPath)
        cell.view.update(text: viewModel.lists[indexPath.item].name)
        cell.view.update(image: #imageLiteral(resourceName: "LoginIcon"))
        cell.view.update(selector: #selector(deleteButtonAction))
        return cell
    }
}

extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.listCellDidTap(list: viewModel.lists[indexPath.item])
    }
}
