//
//  UserInfoType.swift
//  Jackflix_CodeBase
//
//  Created by 임영준 on 2023/08/24.
//

import Foundation

enum UserInfoType : String, CaseIterable{
    
    case emailOrPhone = "이메일 주소 또는 전화번호"
    case password = "비밀번호"
    case nickname = "닉네임"
    case location = "위치"
    case recommend = "추천 코드 입력"
    
}
