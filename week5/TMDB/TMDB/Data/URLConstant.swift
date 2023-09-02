//
//  EndPoint.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/21.
//

import Foundation

//enum에서 쓰는 거랑 장단점? 차이?
//URL을 extension해서 endpoint까지 붙이는 함수 만들기

struct URLConstant {
    static let baseURL = "https://api.themoviedb.org/3"
    static let imageBaseURL = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2"
    static let trendingURL = "/trending"
}
