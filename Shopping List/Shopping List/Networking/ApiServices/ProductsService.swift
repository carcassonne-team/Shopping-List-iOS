//
//  ProductsService.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 08/05/2021.
//

import Foundation
import Moya

enum ProductsService {
    case fetchProducts
}

extension ProductsService: TargetType, AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        .bearer
    }
    
    var baseURL: URL {
        URL(string: NetworkingConstants.baseURL + "/products")!
    }
    
    var path: String {
        switch self {
        case .fetchProducts:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchProducts:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchProducts:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
