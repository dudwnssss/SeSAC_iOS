//
//  APIService.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/30.
//

import Foundation

class APIService{
    
    private init(){}
    
    static let shared = APIService() //인스턴스 생성 방지
    
    func callRequest(query: String, completionHandeler: @escaping (Photo?) -> Void){
        guard let url = URL(string: URLConstant.searchImageURL+query) else { return }
        let request = URLRequest(url: url, timeoutInterval: 10)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async { //화면갱신마다 main.async 호출을 줄여줌
                if let error { //error nil체크
                    completionHandeler(nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, (200...500).contains(response.statusCode) else {
                    completionHandeler(nil)
                    return
                }
                
                guard let data = data else {
                    completionHandeler(nil)
                    return
                }
                do {
                    let result = try JSONDecoder().decode(Photo.self, from: data)
                    completionHandeler(result)
                } catch {
                    completionHandeler(nil)
                }
                
                //           Hre 
                
            }
        }.resume() //네트워크 통신을 위해 항상 붙여야 함
        
    }
}

