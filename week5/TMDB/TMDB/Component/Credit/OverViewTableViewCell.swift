//
//  OverViewTableViewCell.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {

    var isMoreButtonSelected: Bool = false
    
    let overviewLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 14)
    }
    let moreButton = UIButton().then{
        $0.setTitle("", for: .normal)
        $0.tintColor = .black
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setProperties()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setFullOverView(){
        overviewLabel.numberOfLines = 0
        moreButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
    }
    
    func setSummaryOverView(){
        overviewLabel.numberOfLines = 2
        moreButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    }
    
    func configureCell(isMore: Bool){
        if isMore{
            setFullOverView()
        }
        else {
            setSummaryOverView()
        }
    }
    
    func setProperties(){
        setSummaryOverView()
    }
    
    func setLayouts(){
        contentView.addSubviews(overviewLabel, moreButton)
        overviewLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.top.equalToSuperview().offset(12)
        }
        moreButton.snp.makeConstraints {
            $0.centerX.equalTo(overviewLabel)
            $0.top.equalTo(overviewLabel.snp.bottom)
            $0.bottom.lessThanOrEqualToSuperview().offset(-12)
        }
        
    }
    
}
