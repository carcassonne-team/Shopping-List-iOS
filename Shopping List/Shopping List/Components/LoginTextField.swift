//
//  LoginTextField.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 08/04/2021.
//

import UIKit
import SnapKit

extension UITextField {
    private enum Constans {
        static let height: CGFloat = 60
    }
    static func loginTextField() -> UITextField {
        let textField = UITextField()
        textField.textContentType = .username
        textField.keyboardType = .emailAddress
        textField.font = Fonts.textField
        textField.backgroundColor = Colors.LoginTextField.background
        textField.textColor = Colors.LoginTextField.text
        textField.snp.makeConstraints { make in
            make.height.equalTo(Constans.height)
        }
        
        return textField
    }
    static func passwordTextField() -> UITextField {
        let textField = UITextField()
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.font = Fonts.textField
        textField.backgroundColor = Colors.LoginTextField.background
        textField.textColor = Colors.LoginTextField.text
        textField.snp.makeConstraints { make in
            make.height.equalTo(Constans.height)
        }
        
        return textField
    }
    
}
