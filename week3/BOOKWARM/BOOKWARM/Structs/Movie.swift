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
    var bgColor: UIColor = getRandomColor()
    var rateLabelText : String {
        get{
            return "평균★\(rate)"
        }
    }
    
    static func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    mutating func toggleLike(){
        like.toggle()
    }
    
}

struct Poster{
    var image: UIImage  = UIImage(systemName: "star") ?? UIImage()
}
