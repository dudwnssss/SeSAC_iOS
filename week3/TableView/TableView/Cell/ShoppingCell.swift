//
//  ShoppingCell.swift
//  TableView
//
//  Created by 임영준 on 2023/07/27.
//

import UIKit

class ShoppingCell: UITableViewCell {
    
    @IBOutlet var cellBackgroundView: UIView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var starButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        titleLabel.font = .systemFont(ofSize: 14)
        checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        checkButton.setImage(UIImage(systemName:  "checkmark.square.fill"), for: .selected)
        
        starButton.setImage(UIImage(systemName: "star"), for: .normal)
        starButton.setImage(UIImage(systemName:  "star.fill"), for: .selected)
        
        checkButton.tintColor = .black
        starButton.tintColor = .black
        cellBackgroundView.layer.cornerRadius = 16
        cellBackgroundView.backgroundColor = .systemGray6
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func checkButtonDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @IBAction func starButtonDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
}
