//
//  BirthdayViewModel.swift
//  SeSACRxThreads
//
//  Created by 임영준 on 2023/11/01.
//

import Foundation
import RxSwift
import RxCocoa

class BirthdayViewModel {
    
    let disposeBag = DisposeBag()
    
    //Input
    let birthday = PublishRelay<Date>()
    
    //Output
    let year = BehaviorRelay<Int>(value: 2022)
    let month = BehaviorRelay<Int>(value: 12)
    let day = BehaviorRelay<Int>(value: 22)
    let isValid = BehaviorRelay<Bool>(value: false)
    
    init(){
        bind()
    }

}

extension BirthdayViewModel {
    func bind() {
        birthday
            .bind(with: self) { owner, date in
                let component = Calendar.current.dateComponents([.year, .month, .day], from: date)
                owner.year.accept(component.year!)
                owner.month.accept(component.month!)
                owner.day.accept(component.day!)
                
                //만 나이 계산
                let limitBirthday = Calendar.current.date(byAdding: .year, value: -17, to: .now)
                owner.isValid.accept(date < limitBirthday!)
            }
            .disposed(by: disposeBag)
    }
    
}
