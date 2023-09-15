//
//  SearchImageManager.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/30.
//

import Foundation
import Alamofire

class SearchImageManager {
    private init(){}
    static let shared = SearchImageManager()
    
    func callRequest(query: String, success: @escaping(Photo)->Void, failure: @escaping ()-> Void){
        let url = URLConstant.searchImageURL+query
        AF.request(url, method: .get).validate(statusCode: 200...500).responseDecodable(of: Photo.self) { response in
            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                print(error)
                failure()
            }
        }
    }
}
