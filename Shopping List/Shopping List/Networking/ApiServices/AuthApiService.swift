//
//  AuthApiService.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 26/04/2021.
//
// swiftlint:disable colon

import Foundation
import Moya

enum AuthApiService {
    case login(parameters: LoginParameters)
    case register(parameters: RegisterParameters)
}

struct LoginParameters: Encodable {
    let email: String
    let password: String
}

struct RegisterParameters: Encodable {
    let name: String
    let email: String
    let password: String
    let passwordConfirmation: String
}

extension AuthApiService: TargetType {
    var baseURL: URL {
        URL(string: NetworkingConstants.baseURL + "/auth")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        case .register:
            return "/register"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        switch self {
        case .login(parameters: let parameters):
            return .requestCustomJSONEncodable(parameters, encoder: encoder)
        case .register(parameters: let parameters):
            return .requestCustomJSONEncodable(parameters, encoder: encoder)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
