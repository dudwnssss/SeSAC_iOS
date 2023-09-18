//
//  Observable.swift
//  UnsplashRandom
//
//  Created by 임영준 on 2023/09/18.
//

import Foundation

class Observable<T> {
    
    private var listner: ((T) -> Void )?
    
    
    var value: T {
        didSet{
            listner?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        print(#function)
        closure(value)
        listner = closure
    }
}
