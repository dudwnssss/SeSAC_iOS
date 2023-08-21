//
//  CastManager.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/18.
//

import Foundation
import Alamofire

class CastManager{
    static let shared = CastManager()
    func callRequest(id: Int, success: @escaping(Credit)->Void, failure: @escaping ()-> Void){
        let url = "https://api.themoviedb.org/3/movie/\(id)/credits?api_key=\(Key.tmdb)"
        AF.request(url, method: .get).validate(statusCode: 200...500).responseDecodable(of: Credit.self) { response in
            switch response.result{
            case .success(let value):
                success(value)
            case .failure(let error):
                print(error)
                failure()
            }
        }
        
    }
}
