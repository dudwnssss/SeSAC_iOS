//
//  OverViewTableViewCell.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {

    var isMoreButtonSelected: Bool = false
    
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setProperties()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setFullOverView(){
        overviewLabel.numberOfLines = 0
        moreButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
    }
    
    func setSummaryOverView(){
        overviewLabel.numberOfLines = 2
        moreButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    }
    
    func configureCell(isMore: Bool){
        if isMore{
            setFullOverView()
        }
        else {
            setSummaryOverView()
        }
    }
    

    
    
    func setProperties(){
        overviewLabel.font = .systemFont(ofSize: 14)
        moreButton.setTitle("", for: .normal)
        moreButton.tintColor = .black
        setSummaryOverView()
    }
    
}
