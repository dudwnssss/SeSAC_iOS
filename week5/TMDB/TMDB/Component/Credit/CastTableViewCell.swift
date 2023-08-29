//
//  CastTableViewCell.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//

import UIKit

class CastTableViewCell: UITableViewCell {

    let actorImageView = UIImageView().then{
        $0.layer.cornerRadius = 2
        $0.backgroundColor = .black
    }
    let actorNameLabel = UILabel()
    let characterLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .lightGray
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        actorImageView.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setLayouts(){
        contentView.addSubviews(actorImageView, actorNameLabel, characterLabel)
        actorImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(4)
            $0.top.bottom.equalToSuperview()
            $0.width.equalTo(actorImageView.snp.height).multipliedBy(0.66)
        }
        actorNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(actorImageView).offset(-8)
            $0.leading.equalTo(actorImageView.snp.trailing).offset(20)
        }
        characterLabel.snp.makeConstraints {
            $0.top.equalTo(actorNameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(actorNameLabel)
        }
    }
}
