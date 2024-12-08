//
//  CoffeeModel.swift
//  MoyaApp
//
//  Created by Sofa on 7.12.24.
//

import UIKit
import Moya
//  https://jsonplaceholder.typicode.com/posts

struct Posts {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

extension Posts: Codable {
    enum PostsCodingKey: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: PostsCodingKey.self)
//        userId = try container.decode(Int.self, forKey: .userId)
//        id = try container.decode(Int.self, forKey: .id)
//        title = try container.decode(String.self, forKey: .title)
//        body = try container.decode(String.self, forKey: .body)
//    }
}
