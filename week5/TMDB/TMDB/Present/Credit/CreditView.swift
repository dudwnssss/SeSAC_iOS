//
//  CreditView.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/29.
//

import UIKit

class CreditView: BaseView {
    
    let backgroundPosterImageView = UIImageView().then{
        $0.contentMode = .scaleAspectFill
    }
    let mainPosterImageView = UIImageView()
    
    let titleLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 18, weight: UIFont.Weight(0.5))
        $0.textColor = .white
    }
    
    lazy var castTableView = UITableView().then{
        $0.rowHeight = UITableView.automaticDimension
        $0.register(OverViewTableViewCell.self, forCellReuseIdentifier: OverViewTableViewCell.identifier)
        $0.register(CastTableViewCell.self, forCellReuseIdentifier: CastTableViewCell.identifier)
    }
    
    override func setLayouts() {
        addSubviews(mainPosterImageView, titleLabel, backgroundPosterImageView, castTableView)
        backgroundPosterImageView.snp.makeConstraints{
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalToSuperview().multipliedBy(0.25)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().inset(24)
        }
        mainPosterImageView.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalTo(backgroundPosterImageView)
            $0.width.equalTo(backgroundPosterImageView).multipliedBy(0.25)
            $0.height.equalTo(mainPosterImageView.snp.width).multipliedBy(1.6)
        }
        castTableView.snp.makeConstraints {
            $0.top.equalTo(backgroundPosterImageView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
    }
}
