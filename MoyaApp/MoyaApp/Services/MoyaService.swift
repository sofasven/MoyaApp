//
//  MoyaService.swift
//  MoyaApp
//
//  Created by Sofa on 8.12.24.
//

import Moya
import UIKit

enum MoyaSevice {
    case posts(userId: Int)
}
extension MoyaSevice: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .posts(let userId):
            return "/posts/" + String(userId)
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var headers: [String : String]? {
        return nil
    }

    var task: Task {
        return .requestPlain
        }
    
    var sampleData: Data {
            return Data()
        }
}
