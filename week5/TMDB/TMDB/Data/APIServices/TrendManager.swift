//
//  TrendManager.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//

import Foundation
import Alamofire

//구조체를 바로 전달하지 말고 가공해서 전달?
class TrendManager{
    static let shared = TrendManager()
    func callRequest(success: @escaping(Trend)->Void, failure: @escaping ()-> Void){
        let url = "\(URLConstant.baseURL)/trending/movie/week?api_key=\(Key.tmdb)"
        AF.request(url, method: .get).validate(statusCode: 200...500).responseDecodable(of: Trend.self) { response in
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

