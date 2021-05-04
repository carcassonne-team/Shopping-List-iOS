//
//  ListProvider.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 29/04/2021.
//

import Foundation
import Moya
import KeychainSwift

final class ListApiProvider {
    private let keychain = KeychainSwift()
    private lazy var moyaProvier = MoyaProvider<ProductListsService>(plugins: [AccessTokenPlugin(tokenClosure: { [weak self] _ in
        return self?.keychain.get("token") ?? ""
    })])
}
