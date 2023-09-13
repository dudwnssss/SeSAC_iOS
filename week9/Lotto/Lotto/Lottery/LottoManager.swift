//
//  LottoManager.swift
//  Lotto
//
//  Created by 임영준 on 2023/09/13.
//

import Foundation
import Alamofire

class LottoManager{
    
    static let shared = LottoManager()
    
    func callLotto(drwNo: Int, completionHandler: @escaping (Lotto)-> Void){
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1080"
        //통신 / 응답
        AF.request(url, method: .get).validate()
            .responseDecodable(of: Lotto.self) { response in
                switch response.result{
                case .success(let success):
                    completionHandler(success)
                case .failure(_):
                    debugPrint(response)
                }
            }
    }
    
}

// MARK: - Lotto
struct Lotto: Codable {
    let totSellamnt: Int
    let returnValue, drwNoDate: String
    let firstWinamnt, drwtNo6, drwtNo4, firstPrzwnerCo: Int
    let drwtNo5, bnusNo, firstAccumamnt, drwNo: Int
    let drwtNo2, drwtNo3, drwtNo1: Int
}
