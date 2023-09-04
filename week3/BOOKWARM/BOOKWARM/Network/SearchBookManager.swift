//
//  SearchBookManager.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/09/04.
//

import Foundation
import Alamofire

class SearchBookManager {
    static let shared = SearchBookManager()
    private init () {}
    
    let header: HTTPHeaders = ["Authorization":"KakaoAK b891b8a4c83cb2a555d28d1e6bd93f8a"]
    func callRequest(query: String, completionHandler: @escaping (BookInfo) -> Void){
        let url = "https://dapi.kakao.com/v3/search/book?target=title"
        let parameter: [String: Any] = ["query": "\(query)"]
        AF.request(url, method: .get, parameters: parameter, headers: header).validate(statusCode: 200...500).responseDecodable(of: BookInfo.self) { response in
            switch response.result{
            case .success(let success):
                completionHandler(success)
            case .failure(_):
                debugPrint(response)
            }
        }
    }
}
