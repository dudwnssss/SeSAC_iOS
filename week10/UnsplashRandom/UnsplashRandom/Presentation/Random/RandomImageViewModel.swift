//
//  RandomImageViewModel.swift
//  UnsplashRandom
//
//  Created by 임영준 on 2023/09/18.
//

import Foundation

class RandomViewModel{
    
    var photoList: Observable<[Photo]> = Observable([])
    
    var isFetchButtonDidTap = Observable(false)
    
    
    
}
