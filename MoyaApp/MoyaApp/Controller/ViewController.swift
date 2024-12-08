//
//  ViewController.swift
//  MoyaApp
//
//  Created by Sofa on 7.12.24.
//

import UIKit
import Moya

class ViewController: UIViewController {
    
    private var posts: [Posts] = []
    private let networkManager: NetworkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        loadPosts(userId: 1)
    }
    
    private func loadPosts(userId: Int) {
        networkManager.getPosts(userId: userId) { [weak self] result in
            guard let self else { return
                switch result {
                case .success(let posts):
                    print(posts)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

