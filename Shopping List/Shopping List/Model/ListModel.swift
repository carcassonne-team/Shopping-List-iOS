//
//  ListModel.swift
//  Shopping List
//
//  Created by Mateusz Leśniara on 29/04/2021.
//

import Foundation

final class ListModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case content = "list_content"
    }
    let id: Int?
    let name: String?
    let content: [Content]?
    
    struct Content: Codable {
         enum CodingKeys: String, CodingKey {
            case productName = "product_name"
            case productId = "product_id"
            case categoryName = "category_name"
            case categoryId = "category_id"
        }
        let productName: String?
        let productId: Int?
        let categoryName: String?
        let categoryId: Int?
    }
}
