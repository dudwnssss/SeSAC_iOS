//
//  Movie.swift
//  Movie
//
//  Created by 임영준 on 2023/07/28.
//

import UIKit

struct Movie{
    let title: String
    let releaseDate: String
    let runtime: Int
    let overview: String
    var rate: Double
    lazy var poster : Poster = Poster()
    var like: Bool = false
    var bgColor: UIColor = .black
    
    var rateLabelText : String {
        get{
            return "평균★\(rate)"
        }
    }
}

struct Poster{
    var image: UIImage  = UIImage(systemName: "star") ?? UIImage()
}
