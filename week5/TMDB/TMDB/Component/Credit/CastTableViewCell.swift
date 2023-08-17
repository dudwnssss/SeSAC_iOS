//
//  CastTableViewCell.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//

import UIKit

class CastTableViewCell: UITableViewCell {

    @IBOutlet var actorImageView: UIImageView!
    @IBOutlet var actorNameLabel: UILabel!
    @IBOutlet var characterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setProperties()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setProperties(){
        actorImageView.layer.cornerRadius = 10
        characterLabel.font = .systemFont(ofSize: 14)
        characterLabel.textColor = .lightGray
    }
    
}
