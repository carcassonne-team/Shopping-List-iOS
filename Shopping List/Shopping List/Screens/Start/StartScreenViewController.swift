//
//  StartScreenViewController.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 14/03/2021.
//

import UIKit

class StartScreenViewController: UIViewController {
    private let viewModel: StartScreenViewModelProtocol
    
    init(viewModel: StartScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
