//
//  OverViewTableViewCell.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {

    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setProperties()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setProperties(){
        overviewLabel.numberOfLines = 2
        moreButton.setTitle("", for: .normal)
        moreButton.tintColor = .black
        moreButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    }
    
}
