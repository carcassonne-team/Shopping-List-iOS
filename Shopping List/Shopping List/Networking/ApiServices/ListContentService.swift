//
//  ListContentService.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 09/05/2021.
//
// swiftlint:disable colon

import Foundation
import Moya

enum ListContentService {
    case addProduct(parameters: AddParameters)
}

struct AddParameters: Encodable {
    let productListId: Int
    let productId: Int
}

extension ListContentService: TargetType, AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        .bearer
    }
    
    var baseURL: URL {
        URL(string: NetworkingConstants.baseURL + "/list_content")!
    }
    
    var path: String {
        switch self {
        case .addProduct:
            return "/add"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .addProduct:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .addProduct(parameters: let parameters):
            return .requestCustomJSONEncodable(parameters, encoder: JSONEncoder.snakeCaseEncoder)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
