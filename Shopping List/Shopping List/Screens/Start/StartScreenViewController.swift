//
//  StartScreenViewController.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 14/03/2021.
//

import UIKit
import SnapKit

final class StartScreenViewController: UIViewController {
    private enum Constants {
        enum Margins {
            static let stackViewTop: CGFloat = 64
            static let stackViewSide: CGFloat = 16
            static let stackViewBottom: CGFloat = 32
        }
        static let textFieldSpacing: CGFloat = 16
        static let imageViewHeight: CGFloat = 150
        static let imageViewWidth: CGFloat = 100
        static let imageViewSpacing: CGFloat = 50
        static let separatorViewHeight: CGFloat = 19
        static let screenName = "Login"
        static let loginSeparator = "or"
    }
    private let viewModel: StartScreenViewModelProtocol
    private let navigationBarAppearace = UINavigationBar.appearance()
    private let stackView = UIStackView()
    private let separatorView = UILabel()
    private let imageView = UIImageView()
    private let emailTextField = UITextField.loginTextField()
    private let passwordTextField = UITextField.passwordTextField()
    private let loginButton = UIButton.commonButton()
    private let signInButton = UIButton()
    private let socialMediaStackView = UIStackView.socialMediaMenuView()
    
    init(viewModel: StartScreenViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
    }
    
    private func commonInit() {
        view.backgroundColor = .white
        title = Constants.screenName
        navigationController?.setNavigationBarHidden(false, animated: false)
        view.addSubview(stackView)
        setupStackView()
        setupImageView()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupSeparator()
        setupSocialMediaStackView()
        setupSpacings()
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(signInButton)
        stackView.addArrangedSubview(separatorView)
        stackView.addArrangedSubview(socialMediaStackView)
        stackView.addArrangedSubview(UIView())
        stackView.layoutMargins = .init(top: Constants.Margins.stackViewTop,
                                        left: Constants.Margins.stackViewSide,
                                        bottom: Constants.Margins.stackViewBottom,
                                        right: Constants.Margins.stackViewSide)
    }
    
    private func setupImageView() {
        imageView.image = #imageLiteral(resourceName: "loginIcon")
        imageView.snp.makeConstraints { make in
            make.height.lessThanOrEqualTo(Constants.imageViewHeight)
            make.width.lessThanOrEqualTo(Constants.imageViewWidth)
        }
    }
    
    private func setupSeparator() {
        separatorView.text = Constants.loginSeparator
        separatorView.textAlignment = .center
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(Constants.separatorViewHeight)
            make.leading.trailing.equalTo(stackView).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func setupSocialMediaStackView() {
        socialMediaStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func setupEmailTextField() {
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(Constants.Margins.stackViewSide)
        }
    }
    private func setupPasswordTextField() {
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func setupLoginButton() {
        loginButton.setTitle(Constants.screenName, for: .normal)
        loginButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func setupSpacings() {
        stackView.setCustomSpacing(Constants.imageViewSpacing, after: imageView)
        stackView.setCustomSpacing(Constants.textFieldSpacing, after: emailTextField)
        stackView.setCustomSpacing(Constants.textFieldSpacing, after: passwordTextField)
        stackView.setCustomSpacing(Constants.textFieldSpacing, after: separatorView)
    }
}
