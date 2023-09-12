//
//  Observable.swift
//  Jackflix_CodeBase
//
//  Created by 임영준 on 2023/09/12.
//

import Foundation

class Observable<T>{
    
    private var listner: ((T) -> Void)? //클로저를 저장하는 변수
    
    var value: T { //값이 변경됨을 감지, 변경되면 listner로 값 전달
        didSet {
            listner?(value)
        }
    }
    
    init(_ value: T) { //초기화
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void){
        closure(value)
        listner = closure
    }
    
}
