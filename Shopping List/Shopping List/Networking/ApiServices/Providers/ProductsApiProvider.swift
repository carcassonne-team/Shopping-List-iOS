//
//  ProductsApiProvider.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 08/05/2021.
//

import Foundation
import Moya
import KeychainSwift

final class ProductsApiProvider {
    private let keychain = KeychainSwift()
    lazy var moyaProvier = MoyaProvider<ProductsService>(plugins: [AccessTokenPlugin(tokenClosure: { [weak self] _ in
        return self?.keychain.get("token") ?? ""
    })])
}
