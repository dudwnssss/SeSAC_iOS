//
//  SignUpViewModel.swift
//  Jackflix_CodeBase
//
//  Created by 임영준 on 2023/09/12.
//

import Foundation

class SignupViewModel{
    
    var email = Observable("")
    var password = Observable("")
    var nickname = Observable("")
    var location = Observable("")
    var recommend = Observable("")
    var isValid = Observable(false)
    
    func checkValidation(){
        if !email.value.isEmpty &&
            !password.value.isEmpty &&
            !nickname.value.isEmpty &&
            !location.value.isEmpty {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
}
