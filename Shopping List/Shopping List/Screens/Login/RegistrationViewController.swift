//
//  LoginViewController.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 17/03/2021.
//

import UIKit

final class RegistrationViewController: UIViewController {
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
    private let viewModel: RegistrationViewModelProtocol
    private let stackView = UIStackView()
    private let nameTextField = UITextField.baseTextField()
    private let emailTextField = UITextField.loginTextField()
    private let passwordTexField = UITextField.passwordTextField()
    private let passwordConfirmTextField = UITextField.passwordTextField()
    private let signUpButton = UIButton.commonButton()
    private let category = CategoryView()
    
    init(viewModel: RegistrationViewModelProtocol) {
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
    
    @objc func registerButtonAction(sender: UIButton!) {
        viewModel.registerButtonDidTap(registerParameters: registrationCredentials())
    }
    
    private func commonInit() {
        view.backgroundColor = .white
        title = NSLocalizedString("signUpButtonTitle", comment: "")
        view.addSubview(stackView)
        setupStackView()
        setupNameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupPasswordConfirmTextField()
        setupSingUpButton()
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = Constants.stackViewSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        [nameTextField, emailTextField, passwordTexField, passwordConfirmTextField, signUpButton, UIView()]
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
    
    private func setupEmailTextField() {
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func setupPasswordTextField() {
        passwordTexField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func setupPasswordConfirmTextField() {
        passwordConfirmTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func setupSingUpButton() {
        signUpButton.addTarget(self, action: #selector(registerButtonAction), for: .touchUpInside)
        signUpButton.setTitle(NSLocalizedString("signUpButtonTitle", comment: ""), for: .normal)
        signUpButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func registrationCredentials() -> RegisterParameters {
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTexField.text ?? ""
        let passwordConfirm = passwordConfirmTextField.text ?? ""
        
        return RegisterParameters(name: name, email: email, password: password, passwordConfirmation: passwordConfirm)
    }
}
