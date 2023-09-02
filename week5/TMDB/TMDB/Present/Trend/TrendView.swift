//
//  TrendView.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/29.
//

import UIKit

class TrendView: BaseView {
    
    lazy var trendTableView = UITableView().then{
        $0.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        $0.register(TVTableViewCell.self, forCellReuseIdentifier: TVTableViewCell.identifier)
        $0.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.identifier)
        $0.separatorStyle = .none
        $0.rowHeight = 450
    }
    
    override func setLayouts() {
        addSubview(trendTableView)
        trendTableView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
