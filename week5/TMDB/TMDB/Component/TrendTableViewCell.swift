//
//  TrendTableViewCell.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//

import UIKit

class TrendTableViewCell: UITableViewCell {

    @IBOutlet var shadowBackgroundView: UIView!
    @IBOutlet var trendBackgroundView: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var clipButton: UIButton!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var rateTextLabel: UILabel!
    @IBOutlet var rateScoreLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var castLabel: UILabel!
    @IBOutlet var separatorView: UIView!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var arrowButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        setProperties()
    }
    
    func setProperties(){
        
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .gray
        
        genreLabel.font = .boldSystemFont(ofSize: 18)
        
        posterImageView.backgroundColor = .black
        rateTextLabel.text = "평점"
        rateTextLabel.backgroundColor = .systemIndigo
        rateTextLabel.textColor = .white
        
        trendBackgroundView.layer.cornerRadius = 10
        trendBackgroundView.clipsToBounds = true
        
        shadowBackgroundView.setShadowView()
        
        separatorView.backgroundColor = .black
        detailLabel.font = .systemFont(ofSize: 14)
        arrowButton.setTitle("", for: .normal)
        arrowButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        arrowButton.tintColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
