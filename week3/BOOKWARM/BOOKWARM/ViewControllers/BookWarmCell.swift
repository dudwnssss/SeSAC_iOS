//
//  BookWarmCell.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/07/31.
//

import UIKit

class BookWarmCell: UICollectionViewCell {

    static let identifier = "BookWarmCell"
    
    @IBOutlet var bgView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setProperties()
    }
    
    func configureCell(row: Movie){
        titleLabel.text = row.title
        rateLabel.text = "\(row.rate)"
        posterImageView.image = UIImage(named: row.title)
        
        row.like ? likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal) : likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        
        bgView.backgroundColor = row.bgColor
    }
    
    func setProperties(){
        bgView.backgroundColor = .lightGray
        bgView.layer.cornerRadius = 12
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 16)
        rateLabel.textColor = .white
        rateLabel.font = .systemFont(ofSize: 12)
        likeButton.setTitle("", for: .normal)
        likeButton.tintColor = .white

    }
}
