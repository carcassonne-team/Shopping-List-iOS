//
//  LoginViewController.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 17/03/2021.
//

import UIKit

final class RegistrationViewController: UIViewController {
    private enum Constants {
        static let stackViewTopMargin: CGFloat = 64
        static let stackViewSideMargin: CGFloat = 16
        static let stackViewBottomMargin: CGFloat = 32
    }
    private let viewModel: RegistrationViewModelProtocol
    private let stackView = UIStackView()
    
    init(viewModel: RegistrationViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Te"
        view.addSubview(stackView)
    }
}
