//
//  SettingType.swift
//  Setting
//
//  Created by 임영준 on 2023/09/15.
//

import Foundation

enum SettingType: Int, CaseIterable {
    case total
    case personal
    case etc
    
    var settingTitle: String {
        switch self {
        case .total:
            return "전체설정"
        case .personal:
            return "개인설정"
        case .etc:
            return "기타"
        }
    }
    
    var settingDetail: [String]{
        switch self{
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "프로필"]
        case .etc:
            return ["고객센터/도움말"]
        }
    }
}
