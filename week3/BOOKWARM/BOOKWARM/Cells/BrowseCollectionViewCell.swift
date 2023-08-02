//
//  BrowseCollectionViewCell.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit

class BrowseCollectionViewCell: UICollectionViewCell {

    @IBOutlet var posterImageView: UIImageView!
    
    static let identifier = "BrowseCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setProperties()
    }
    
    func configureCell(row: Movie){
        posterImageView.image = UIImage(named: row.title)
    }

    func setProperties(){
        posterImageView.configureRoundedView()
    }
}
