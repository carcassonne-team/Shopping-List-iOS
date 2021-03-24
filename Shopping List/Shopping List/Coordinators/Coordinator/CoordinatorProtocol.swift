//
//  CoordinatorProtocol.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 14/03/2021.
//

import Foundation

final class LinkedCoordinators {
    var children = [CoordinatorType: CoordinatorProtocol]()
    weak var parent: CoordinatorProtocol?
}

protocol CoordinatorProtocol: AnyObject {
    var type: CoordinatorType { get }
    var linkedCoordinators: LinkedCoordinators { get }
    
    func start()
    func coordinate(to coordinator: CoordinatorProtocol)
}

extension CoordinatorProtocol {
    func coordinate(to coordinator: CoordinatorProtocol) {
        linkedCoordinators.children[coordinator.type] = coordinator
        coordinator.linkedCoordinators.parent = self
        coordinator.start()
    }
    
    func finish(child: CoordinatorProtocol) {
        linkedCoordinators.children[child.type] = nil
    }
}
