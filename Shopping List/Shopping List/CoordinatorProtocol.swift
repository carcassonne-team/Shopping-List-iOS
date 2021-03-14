//
//  CoordinatorProtocol.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 14/03/2021.
//

import Foundation

protocol CoordinatorProtocol: AnyObject {
    func start()
    func didFinish(with child: CoordinatorProtocol?)
}
