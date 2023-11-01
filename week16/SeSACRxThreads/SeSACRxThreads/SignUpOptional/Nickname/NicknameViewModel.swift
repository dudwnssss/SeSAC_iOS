//
//  NicknameViewModel.swift
//  SeSACRxThreads
//
//  Created by 임영준 on 2023/11/01.
//

import Foundation
import RxSwift
import RxCocoa

class NicknameViewModel {
    
    let disposeBag = DisposeBag()
    
    //Input
    let nickname = PublishRelay<String>()
    
    //Output
    let isValid = BehaviorRelay<Bool>(value: false)
    
    init(){
        bind()
    }

}

extension NicknameViewModel {
    func bind() {
        nickname
            .map { $0.count >= 2 && $0.count < 6 }
            .bind(with: self) { owner, value in
                owner.isValid.accept(value)
            }
            .disposed(by: disposeBag)
    }
}
