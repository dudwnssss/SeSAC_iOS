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
    typealias completionHandler = (All?) -> Void
    
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
    
    func callURLSecssionRequest(completionHandler: @escaping completionHandler){
        guard let url = URL(string: URLConstant.baseURL+URLConstant.trendingURL+"/all"+"/day"+"?api_key=\(Key.tmdb)") else {return}
        let requst = URLRequest(url: url, timeoutInterval: 5)
        URLSession.shared.dataTask(with: requst) { data, response, error in
            DispatchQueue.main.async(){
                if let error {
                    completionHandler(nil)
                    return }
                guard let response = response as? HTTPURLResponse, (200...500).contains(response.statusCode) else { completionHandler(nil)
                    return }
                guard let data else {
                    completionHandler(nil)
                    return
                }
                do {
                    let result = try JSONDecoder().decode(All.self, from: data)
                    completionHandler(result)
                } catch {
                    completionHandler(nil)
                }
            }
        }.resume()
    }
}

