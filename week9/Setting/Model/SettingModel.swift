//
//  SettingModel.swift
//  Setting
//
//  Created by 임영준 on 2023/09/15.
//

import Foundation

struct Setting : Hashable{
    let id = UUID().uuidString
    let itemTitle : String
}
