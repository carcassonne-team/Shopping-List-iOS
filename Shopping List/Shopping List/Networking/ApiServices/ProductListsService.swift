//
//  ProductListsService.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 28/04/2021.
//

import Foundation
import Moya

enum ProductListsService {
    case fetchList
    case createList(parameters: CreateParameters)
    case deleteList(parameters: DeleteParameters)
}

struct CreateParameters: Encodable {
    let name: String
}

struct DeleteParameters: Encodable {
    let id: String
}

extension ProductListsService: TargetType, AccessTokenAuthorizable {
    var authorizationType: AuthorizationType? {
        .bearer
    }
    
    var baseURL: URL {
        URL(string: NetworkingConstants.baseURL + "/lists")!
    }
    
    var path: String {
        switch self {
        case .fetchList:
            return ""
        case .createList:
            return "/create"
        case .deleteList(parameters: let parameters):
            return "/delete/" + parameters.id
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchList:
            return .get
        case .createList:
            return .post
        case .deleteList:
            return .delete
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchList:
            return .requestPlain
        case .createList(parameters: let parameters):
            return .requestCustomJSONEncodable(parameters, encoder: JSONEncoder.snakeCaseEncoder)
        case .deleteList(parameters: let parameters):
            return .requestCustomJSONEncodable(parameters, encoder: JSONEncoder.snakeCaseEncoder)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

extension JSONEncoder {
    static let snakeCaseEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
}
