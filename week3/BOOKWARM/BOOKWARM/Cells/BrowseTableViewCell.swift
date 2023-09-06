//
//  BrowseTableViewCell.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit

final class BrowseTableViewCell: UITableViewCell {

    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    
    static let identifier = "BrowseTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setProperties()
    }
    
    func configureCell(row: Movie){
        titleLabel.text = row.title
        dateLabel.text = row.releaseDate
        rateLabel.text = "\(row.rateLabelText)"
        posterImageView.image = UIImage(named: row.title)
    }
    
    func setProperties(){
        posterImageView.configureRoundedView()
        titleLabel.font = .boldSystemFont(ofSize: 15)
        dateLabel.textColor = .lightGray
        dateLabel.font = .systemFont(ofSize: 12)
        rateLabel.textColor = .systemPink
        rateLabel.font = .systemFont(ofSize: 12)
    }


    
}
