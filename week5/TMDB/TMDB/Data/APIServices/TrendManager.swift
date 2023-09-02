//
//  TrendManager.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//

import Foundation
import Alamofire
import AVFoundation



enum MediaType: String, CaseIterable, Codable{
    case all = "all"
    case tv = "tv"
    case movie = "movie"
    case person = "person"
    
    var contentURL: String{
        switch self {
        case .tv:
            return "/tv"
        case .movie:
            return "/movie"
        case .person:
            return "/person"
        case .all:
            return "/all"
        }
    }
    
//    var Model: Decodable {
//        switch self {
//        case .tv:
//            return TV.self
//        case .movie:
//            return Movie.self
//        case .person:
//            return Person.self
//        case .all:
//            return All.self
//        }
//    }
}

class TrendManager{
    static let shared = TrendManager()
    private init() {} //인스턴스 생성 방지
    typealias completionHandler = (All) -> Void
    
    func callAllRequest(completionHandler: @escaping completionHandler) {
        let url = URLConstant.baseURL+URLConstant.trendingURL+"/all"+"/day"+"?api_key=\(Key.tmdb)"
        AF.request(url, method: .get)
            .validate(statusCode: 200...500)
            .responseDecodable(of: All.self) {response in
                switch response.result {
                case .success(let value):
                    print(value)
                    completionHandler(value)
                case .failure(let error):
                    print(error)
                }
                
            }
    }
    
    
}

