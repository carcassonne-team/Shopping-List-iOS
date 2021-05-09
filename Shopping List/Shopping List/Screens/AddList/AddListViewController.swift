//
//  AddListViewController.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 05/05/2021.
//

import Foundation
import UIKit

final class AddListViewController: UIViewController {
    private enum Constants {
        enum Margins {
            static let stackViewTop: CGFloat = 64
            static let stackViewSide: CGFloat = 16
            static let stackViewBottom: CGFloat = 32
        }
        static let stackViewTopMargin: CGFloat = 64
        static let stackViewSideMargin: CGFloat = 16
        static let stackViewSpacing: CGFloat = 16
        static let stackViewBottomMargin: CGFloat = 32
    }
    private let viewModel: AddListViewModelProtocol
    private let stackView = UIStackView()
    private let nameTextField = UITextField.baseTextField()
    private let addListButton = UIButton.commonButton()
    
    init(viewModel: AddListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonAction(sender: UIButton!) {
        viewModel.addListButtonDidTap(name: listName() )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
    }
    
    private func commonInit() {
        view.backgroundColor = .white
        stackView.axis = .vertical
        title = NSLocalizedString("addListTitle", comment: "")
        view.addSubview(stackView)
        setupStackView()
        setupNameTextField()
        setupAddListButton()
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = Constants.stackViewSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        [nameTextField, addListButton, UIView()]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        
        stackView.layoutMargins = .init(top: Constants.Margins.stackViewTop,
                                        left: Constants.Margins.stackViewSide,
                                        bottom: Constants.Margins.stackViewBottom,
                                        right: Constants.Margins.stackViewSide)
    }
    
    private func setupNameTextField() {
        nameTextField.placeholder = NSLocalizedString("namePlaceholder", comment: "")
        nameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func setupAddListButton() {
        addListButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        addListButton.setTitle(NSLocalizedString("addListButton", comment: ""), for: .normal)
        addListButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func listName() -> CreateParameters {
        let name = nameTextField.text ?? ""
        return CreateParameters(name: name)
    }
}
