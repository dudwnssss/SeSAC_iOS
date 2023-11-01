//
//  PhoneViewModel.swift
//  SeSACRxThreads
//
//  Created by 임영준 on 2023/11/01.
//

import Foundation
import RxSwift
import RxCocoa

class PhoneViewModel {
    
    let disposeBag = DisposeBag()
    
    //Input
    let phone = BehaviorRelay<String>(value: "010")
    
    //Output
    let isValid = BehaviorRelay<Bool>(value: false)
    let phoneText = PublishRelay<String>()

    
    init(){
        bind()
    }
}

extension PhoneViewModel {
   
    func bind() {
        phone
            .map { $0.count > 10 }
            .bind(with: self) { owner, value in
                owner.isValid.accept(value)
            }
            .disposed(by: disposeBag)
        
        phone
            .bind(with: self) { owner, value in
                let result = value.formated(by: "###-####-####")
                owner.phoneText.accept(result)
            }
            .disposed(by: disposeBag)
    }
    
}

