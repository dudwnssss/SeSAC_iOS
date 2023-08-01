//
//  MovieCell.swift
//  Movie
//
//  Created by 임영준 on 2023/07/28.
//

import UIKit

class MovieCell: UITableViewCell {

    static let identifier = "MovieCell"
    
    @IBOutlet var posterImageVIew: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setProperties()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setProperties(){
        titleLabel.font = .boldSystemFont(ofSize: 15)
        infoLabel.font = .systemFont(ofSize: 14)
        overviewLabel.font = .systemFont(ofSize: 12)
        posterImageVIew.contentMode = .scaleAspectFill
    }
    
    func configureCell(row: Movie){
        titleLabel.text = row.title
        infoLabel.text = row.movieDescription
        overviewLabel.text = row.overview
        posterImageVIew.image = UIImage(named: "\(row.title)")
    }
}
