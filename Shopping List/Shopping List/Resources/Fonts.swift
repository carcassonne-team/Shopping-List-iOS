//
//  Fonts.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 08/04/2021.
//

import UIKit

public enum Fonts {
    private enum Constants {
        static let small: CGFloat = 12
        static let medium: CGFloat = 16
        static let big: CGFloat = 20
        static let large: CGFloat = 24
    }
    public static let textField = UIFont.systemFont(ofSize: Constants.medium, weight: .regular)
}
