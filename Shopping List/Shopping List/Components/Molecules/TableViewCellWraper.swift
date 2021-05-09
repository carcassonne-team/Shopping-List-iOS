//
//  CategoryCell.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 22/04/2021.
//

import UIKit
import SnapKit

final class TableViewCellWrapper<T: UIView>: UITableViewCell {
    let view: T
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        view = T()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not supported")
    }
    
    private func commonInit() {
        contentView.addSubview(view)
        
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

protocol CellIdentifiable: AnyObject {
    static var cellIdentifier: String { get }
}

extension UITableViewCell: CellIdentifiable {}

extension CellIdentifiable {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func registerCell<T: CellIdentifiable>(for type: T.Type) {
        register(type, forCellReuseIdentifier: type.cellIdentifier)
    }
}
