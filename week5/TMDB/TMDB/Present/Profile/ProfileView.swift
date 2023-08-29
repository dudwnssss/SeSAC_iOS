//
//  ProfileView.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/29.
//

import UIKit

enum EditCase: String, CaseIterable{
    case name = "이름"
    case username = "사용자 이름"
    case genderAlias = "성별 대명사"
    case introduction = "소개"
    case link = "링크"
    case gender = "성별"
    
    static var subTitles: [String] {
        return EditCase.allCases.map { $0.rawValue }
    }
}

class ProfileView : BaseView {
    let tableView = UITableView().then{
        $0.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.identifier)
        $0.rowHeight = 50
    }
    override func setLayouts() {
        addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}




