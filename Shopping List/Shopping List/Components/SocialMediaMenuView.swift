//
//  SocialMediaMenuView.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 08/04/2021.
//

import UIKit
import SnapKit

extension UIStackView {
    private enum Constants {
        static let borderWidth: CGFloat = 1
        static let spacing: CGFloat = 8
        static let imageViewSize: CGFloat = 16
        static let height: CGFloat = 60
    }
    
    static func socialMediaMenuView() -> UIStackView {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = Constants.spacing
        stackView.snp.makeConstraints { make in
            make.height.equalTo(Constants.height)
        }
        [#imageLiteral(resourceName: "FacebookIcon"), #imageLiteral(resourceName: "TwitterIcon"), #imageLiteral(resourceName: "LinkedInIcon")].forEach {
            let imageView = UIImageView()
            let containerView = UIView()
            imageView.image = $0
            containerView.addSubview(imageView)
            stackView.addArrangedSubview(containerView)
            containerView.layer.borderWidth = Constants.borderWidth
            containerView.layer.borderColor = UIColor.gray.cgColor
            imageView.snp.makeConstraints { make in
                make.center.equalTo(containerView)
                make.size.equalTo(Constants.imageViewSize)
            }
        }
        
        return stackView
    }
}
