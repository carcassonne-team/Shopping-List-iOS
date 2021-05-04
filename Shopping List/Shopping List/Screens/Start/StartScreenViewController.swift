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
        static let separatorViewHeight: CGFloat = 16
    }
    private let viewModel: StartScreenViewModelProtocol
    private let navigationBarAppearace = UINavigationBar.appearance()
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let separatorView = UILabel()
    private let imageView = UIImageView()
    private let emailTextField = UITextField.loginTextField()
    private let passwordTextField = UITextField.passwordTextField()
    private let loginButton = UIButton.commonButton()
    private let forgotPassword = UIButton()
    private let signUpButton = UIButton.commonButton()
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
    
    @objc func buttonAction(sender: UIButton!) {
        viewModel.registrationButtonDidTap()
    }
    
    @objc func loginButtonAction(sender: UIButton!) {
        viewModel.loginButtonDidTap()
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardFrame = notification
                .userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect,
              scrollView.contentInset.bottom == 0 else { return }
        scrollView.contentInset.bottom += keyboardFrame.height
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        guard let keyboardFrame = notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect else { return }
        scrollView.contentInset.bottom -= keyboardFrame.height
    }
    
    private func commonInit() {
        view.backgroundColor = .white
        title = NSLocalizedString("signInButtonTitle", comment: "")
        navigationController?.setNavigationBarHidden(false, animated: false)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        setupStackView()
        setupImageView()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupForgotPasswordButton()
        setupSignUp()
        setupScrollView()
        setupSeparator()
        setupSocialMediaStackView()
        setupSpacings()
        setupKeyboardObserving()
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
        }
        [imageView, emailTextField, passwordTextField, loginButton,
         forgotPassword, separatorView, socialMediaStackView, signUpButton]
            .forEach {
                stackView.addArrangedSubview($0)
            }
        
        stackView.layoutMargins = .init(top: Constants.Margins.stackViewTop,
                                        left: Constants.Margins.stackViewSide,
                                        bottom: Constants.Margins.stackViewBottom,
                                        right: Constants.Margins.stackViewSide)
    }
    
    private func setupScrollView() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupImageView() {
        imageView.image = #imageLiteral(resourceName: "LoginIcon")
        imageView.snp.makeConstraints { make in
            make.height.lessThanOrEqualTo(Constants.imageViewHeight)
            make.width.lessThanOrEqualTo(Constants.imageViewWidth)
        }
    }
    
    private func setupSeparator() {
        separatorView.text = NSLocalizedString("loginSeparator", comment: "")
        separatorView.textAlignment = .center
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(Constants.separatorViewHeight)
            make.leading.trailing.equalTo(view).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func setupSocialMediaStackView() {
        socialMediaStackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func setupEmailTextField() {
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(Constants.Margins.stackViewSide)
        }
    }
    private func setupPasswordTextField() {
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func setupLoginButton() {
        loginButton.setTitle(NSLocalizedString("signInButtonTitle", comment: ""), for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        loginButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func setupForgotPasswordButton() {
        forgotPassword.setTitle(NSLocalizedString("passwordForgotButton", comment: ""), for: .normal)
        forgotPassword.setTitleColor(.green, for: .normal)
        forgotPassword.snp.makeConstraints { make in
            make.height.equalTo(Constants.separatorViewHeight)
            make.left.equalTo(stackView).inset(Constants.Margins.stackViewSide)
        }
        
    }
    
    private func setupSignUp() {
        signUpButton.setTitle(NSLocalizedString("signUpButtonTitle", comment: ""), for: .normal)
        signUpButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        signUpButton.snp.makeConstraints { make in
            make.leading.trailing.equalTo(stackView).inset(Constants.Margins.stackViewSide)
        }
    }
    
    private func setupKeyboardObserving() {
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(keyboardWillShow),
                         name: UIResponder.keyboardWillShowNotification,
                         object: nil)
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(keyboardWillHide),
                         name: UIResponder.keyboardWillHideNotification,
                         object: nil)
    }
    
    private func setupSpacings() {
        stackView.setCustomSpacing(Constants.imageViewSpacing, after: imageView)
        stackView.setCustomSpacing(Constants.textFieldSpacing, after: emailTextField)
        stackView.setCustomSpacing(Constants.textFieldSpacing, after: passwordTextField)
        stackView.setCustomSpacing(Constants.textFieldSpacing, after: loginButton)
        stackView.setCustomSpacing(Constants.textFieldSpacing, after: forgotPassword)
        stackView.setCustomSpacing(Constants.textFieldSpacing, after: separatorView)
        stackView.setCustomSpacing(Constants.textFieldSpacing, after: socialMediaStackView)
    }
}
