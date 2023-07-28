//
//  ShoppingCell.swift
//  TableView
//
//  Created by 임영준 on 2023/07/27.
//

import UIKit

class ShoppingCell: UITableViewCell {
    
    static let identifier = "ShoppingCell"
    
    @IBOutlet var cellBackgroundView: UIView!
    @IBOutlet var checkImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var starButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        titleLabel.font = .systemFont(ofSize: 14)
        
        starButton.setImage(UIImage(systemName: "star"), for: .normal)
        starButton.setImage(UIImage(systemName:  "star.fill"), for: .selected)
        
        checkImageView.tintColor = .black
        starButton.tintColor = .black
        cellBackgroundView.configureRoundedColorView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func starButtonDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    func configureCell(row: ShoppingItem){
        titleLabel.text = row.title
        checkImageView.image = row.check ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
        row.like ? starButton.setImage(UIImage(systemName: "star.fill"), for: .normal) : starButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
}
