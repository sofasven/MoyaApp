//
//  NetworkManager.swift
//  MoyaApp
//
//  Created by Sofa on 8.12.24.
//

//import UIKit
import Moya
import Foundation


protocol Networkable {
    var provider: MoyaProvider<MoyaSevice> { get }
    func getPosts(userId: Int, completion: @escaping (Result<[Posts], Error>) -> ())
}

class NetworkManager: Networkable {
    
    var provider = MoyaProvider<MoyaSevice>(plugins: [NetworkLoggerPlugin()])
    
    func getPosts(userId: Int, completion: @escaping (Result<[Posts], Error>) -> ()) {
        request(target: .posts(userId: userId), completion: completion)
    }
    
}

private extension NetworkManager {
    private func request(target: MoyaSevice, completion: @escaping (Result<[Posts], Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode([Posts].self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

//private extension NetworkManager {
//    private func request<T: Decodable>(target: MoyaSevice, completion: @escaping (Result<T, Error>) -> ()) {
//        provider.request(target) { result in
//            switch result {
//            case let .success(response):
//                do {
//                    let results = try JSONDecoder().decode(T.self, from: response.data)
//                    completion(.success(results))
//                } catch let error {
//                    completion(.failure(error))
//                }
//            case let .failure(error):
//                completion(.failure(error))
//            }
//        }
//    }
//}
