//
//  CategoryCell.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 22/04/2021.
//

import UIKit
import SnapKit

final class CategoryView: UIStackView {
    private let imageView = UIImageView()
    private let titleView = UILabel()
    private let chevronView = UIButton()
    
    /// update
    /// konfigurator przyjmuje protocol
    /// extension do Category View
    
    init() {
        super.init(frame: .zero)
        
        commonInit()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(text: String?) {
        titleView.text = text
    }
    
    func update(image: UIImage) {
        imageView.image = image
    }
    
    func update(selector: Selector) {
        chevronView.addTarget(self, action: selector, for: .touchUpInside)
    }
    
   private func commonInit() {
        setupImageView()
        setupTitleView()
        setupChevronView()
        axis = .horizontal
        spacing = 16
    }
    
    private func setupImageView() {
        addArrangedSubview(imageView)
        let insetValue: CGFloat = -25
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "FacebookIcon").withAlignmentRectInsets(UIEdgeInsets(side: insetValue))
        imageView.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.leading.equalTo(self)
        }
    }
    
    private func setupTitleView() {
       addArrangedSubview(titleView)
        titleView.font = Fonts.textField
    }
    
    private func setupChevronView() {
    addArrangedSubview(chevronView)
        chevronView.setTitle("Delete", for: .normal)
        chevronView.setTitleColor(.red, for: .normal)
        chevronView.contentMode = .scaleAspectFit
//        chevronView.image = #imageLiteral(resourceName: "LinkedInIcon")
        chevronView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(60)
            make.trailing.equalTo(self)
        }
    }
}

extension UIEdgeInsets {
    init(top: CGFloat = 0, left: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0) {
        self.init(top: top, left: left, bottom: bottom, right: right)
    }
    
    init(side: CGFloat) {
        self.init(top: side, left: side, bottom: side, right: side)
    }
}
