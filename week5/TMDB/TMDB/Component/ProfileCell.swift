//
//  ProfileCell.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/29.
//

import UIKit

class ProfileCell: BaseTableViewCell{
    let titleLabel = UILabel()
    let subLabel = UILabel().then{
        $0.textColor = .lightGray
    }
    let indicator = UIImageView().then{
        $0.tintColor = .lightGray
        $0.image = UIImage(systemName: "chevron.right")
    }
    override func setLayouts() {
        contentView.addSubviews(titleLabel, subLabel, indicator)
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(8)
        }
        subLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(120)
            $0.centerY.equalToSuperview()
        }
        indicator.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-8)
            $0.centerY.equalToSuperview()
        }
    }
    
    
}
