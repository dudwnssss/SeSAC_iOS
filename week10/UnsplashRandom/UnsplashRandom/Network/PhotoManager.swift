//
//  PhotoManager.swift
//  UnsplashRandom
//
//  Created by 임영준 on 2023/09/18.
//

import Foundation
import Alamofire

class PhotoManager {
    
    static let shared = PhotoManager()
    private init() {}
    
    private let key = "O1lB6mO6V15goTBwglgKLzb1oXKKrQiy9aGDsoadROY"
    
    func fetchRandomPhoto(completion: @escaping ((Photo) -> Void)){
        guard let url = URL(string: "https://api.unsplash.com/photos/random/?client_id=\(key)") else { return }
    
        AF.request(url, method: .get).validate(statusCode: 200...500).responseDecodable(of: Photo.self) { response in
            switch response.result {
            case .success(let success):
                completion(success)
                debugPrint(response)
            case .failure(_):
                debugPrint(response)
            }
        }
    }
}
