//
//  TrendManager.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//

import Foundation
import Alamofire
import AVFoundation



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

