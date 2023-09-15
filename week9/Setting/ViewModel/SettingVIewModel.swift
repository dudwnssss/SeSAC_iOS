//
//  SettingVIewModel.swift
//  Setting
//
//  Created by 임영준 on 2023/09/15.
//

import Foundation

class SettingViewModel{
    
    var totalSettingList = [Setting(itemTitle: "공지사항"), Setting(itemTitle: "실험실"), Setting(itemTitle: "버전정보")]
    var personalSettingList = [Setting(itemTitle: "개인/보안"), Setting(itemTitle: "알림"), Setting(itemTitle: "채팅"), Setting(itemTitle: "멀티프로필")]
    var etcSettingList = [Setting(itemTitle: "고객센터/도움말")]
    
    
    
}
