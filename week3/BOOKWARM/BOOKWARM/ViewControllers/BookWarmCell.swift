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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setProperties()
        // Initialization code
    }
    
    func configureCell(row: Movie){
        titleLabel.text = row.title
        rateLabel.text = "\(row.rate)"
        posterImageView.image = UIImage(named: row.title)
        bgView.backgroundColor = getRandomColor()
    }
    
    func setProperties(){
        bgView.backgroundColor = .systemPink
        bgView.layer.cornerRadius = 12
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 16)
        rateLabel.textColor = .white
        rateLabel.font = .systemFont(ofSize: 12)
        
    }
    
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
