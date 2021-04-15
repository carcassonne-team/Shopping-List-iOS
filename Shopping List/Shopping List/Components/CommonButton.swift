//
//  CommonButton.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 08/04/2021.
//

import UIKit
import SnapKit

extension UIButton {
    private enum Constans {
        static let height: CGFloat = 60
    }
    
    static func commonButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = Colors.CommonButton.background
        button.snp.makeConstraints { make in
            make.height.equalTo(Constans.height)
        }
        
        return button
    }
}
