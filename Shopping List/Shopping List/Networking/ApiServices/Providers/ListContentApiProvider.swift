//
//  ListContentApiProvider.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 09/05/2021.
//

import Foundation
import Moya
import KeychainSwift

final class ListContentApiProvider {
    private let keychain = KeychainSwift()
    lazy var moyaProvier = MoyaProvider<ListContentService>(plugins: [AccessTokenPlugin(tokenClosure: { [weak self] _ in
        return self?.keychain.get("token") ?? ""
    })])
}
