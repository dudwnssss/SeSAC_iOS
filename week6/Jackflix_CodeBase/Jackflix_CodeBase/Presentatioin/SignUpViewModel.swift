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
    var alert = Observable("")
    
    func checkValidation(){
        if !email.value.contains("@"){
            alert.value = "이메일 양식을 지켜주세요"
            isValid.value = false

        } else if !(password.value.count >= 6 && password.value.count <= 10){
            alert.value = "비밀번호는 6~10자리까지 가능합니다"
            isValid.value = false

        } else if nickname.value.isEmpty{
            alert.value = "닉네임이 비어있습니다"
            isValid.value = false

        } else if location.value.isEmpty{
            alert.value = "위치가 비어있습니다"
            isValid.value = false

        } else if recommend.value.count != 6{
            alert.value = "추천코드는 6자리입니다"
            isValid.value = false

        } else {
            isValid.value = true
        }
    }
}
