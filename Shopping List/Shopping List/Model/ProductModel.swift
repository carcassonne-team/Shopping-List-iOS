//
//  ProductModel.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 08/05/2021.
//

import Foundation

final class ProductModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    let id: Int?
    let name: String?
}
