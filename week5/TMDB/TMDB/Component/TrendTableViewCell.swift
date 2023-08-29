//
//  TrendTableViewCell.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//

import UIKit

class TrendTableViewCell: UITableViewCell {

    let shadowBackgroundView = UIView().then{
        $0.setShadowView()
    }
    let trendBackgroundView = UIView().then{
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    let dateLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .gray
    }
    let genreLabel = UILabel().then{
        $0.font = .boldSystemFont(ofSize: 18)
    }
    let clipButton = UIButton().then{
        $0.setImage(UIImage(systemName: "paperclip"), for: .normal)
        $0.backgroundColor = .white
        $0.setTitle("", for: .normal)
        $0.tintColor = .black
        $0.setCircleView()
    }
    let posterImageView = UIImageView().then{
        $0.backgroundColor = .black
        $0.contentMode = .scaleAspectFill
    }
    let rateTextLabel = UILabel().then{
        $0.text = "평점"
        $0.font = .systemFont(ofSize: 13)
        $0.backgroundColor = .systemIndigo
        $0.textAlignment = .center
        $0.textColor = .white
    }
    let rateScoreLabel = UILabel().then{
        $0.backgroundColor = .white
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 13)
    }
    let titleLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 17, weight: UIFont.Weight(0.25))
    }
    let originalTitleLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 16, weight: UIFont.Weight(0.2))
        $0.textColor = .darkGray

    }
    let castLabel = UILabel().then{
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 14)
    }
    let separatorView = UIView().then{
        $0.backgroundColor = .black
    }
    let detailLabel = UILabel().then{
        $0.text = "자세히 보기"
        $0.font = .systemFont(ofSize: 14)
    }
    let arrowButton = UIButton().then{
        $0.setTitle("", for: .normal)
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .lightGray
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setProperties()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
    }
    
    func setProperties(){
        
    }
    
    func setLayouts(){
        contentView.addSubviews(dateLabel, genreLabel, shadowBackgroundView)
        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.top.equalToSuperview().offset(24)
        }
        genreLabel.snp.makeConstraints {
            $0.leading.equalTo(dateLabel)
            $0.top.equalTo(dateLabel.snp.bottom)
        }
        shadowBackgroundView.snp.makeConstraints {
            $0.top.equalTo(genreLabel.snp.bottom).offset(12)
            $0.bottom.horizontalEdges.equalToSuperview().inset(12)
        }
        shadowBackgroundView.addSubview(trendBackgroundView)
        trendBackgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        trendBackgroundView.addSubviews(posterImageView, rateTextLabel, rateScoreLabel, clipButton, castLabel, detailLabel, arrowButton, titleLabel, separatorView, originalTitleLabel)
        posterImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.7)
        }
        rateTextLabel.snp.makeConstraints {
            $0.leading.bottom.equalTo(posterImageView).inset(12)
            $0.width.equalTo(36)
            $0.height.equalTo(24)
        }
        rateScoreLabel.snp.makeConstraints {
            $0.width.equalTo(36)
            $0.height.equalTo(24)
            $0.centerY.equalTo(rateTextLabel)
            $0.leading.equalTo(rateTextLabel.snp.trailing)
        }
        clipButton.snp.makeConstraints {
            $0.top.trailing.equalTo(posterImageView).inset(12)
            $0.size.equalTo(35)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(rateTextLabel)
            $0.top.equalTo(posterImageView).offset(20)
            $0.trailing.equalTo(originalTitleLabel.snp.leading).offset(-10)
        }
        castLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalTo(clipButton)
            $0.top.equalTo(castLabel.snp.bottom)
        }
        originalTitleLabel.snp.makeConstraints {
            $0.trailing.equalTo(clipButton)
            $0.bottom.equalTo(castLabel.snp.top)
        }
        separatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalTo(castLabel)
            $0.bottom.equalTo(arrowButton.snp.top)
        }
        arrowButton.snp.makeConstraints {
            $0.trailing.equalTo(clipButton)
            $0.bottom.equalToSuperview().offset(-12)
        }
        detailLabel.snp.makeConstraints {
            $0.centerY.equalTo(arrowButton)
            $0.leading.equalTo(separatorView)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
