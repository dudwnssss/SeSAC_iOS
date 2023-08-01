//
//  DetailViewController.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var infoBackgroundView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImageVIew: UIImageView!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var memoTextView: UITextView!
    
    var movie = Movie(title: "", releaseDate: "", runtime: 0, overview: "", rate: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
        setNavigationBar()
    }
    
    func setProperties(){
        titleLabel.text = movie.title
        titleLabel.font = .boldSystemFont(ofSize: 17)
        titleLabel.textColor = .white
        posterImageVIew.image = UIImage(named: "\(movie.title)")
        overviewLabel.text = movie.overview
        overviewLabel.numberOfLines = 0
        overviewLabel.font = .systemFont(ofSize: 14)
        rateLabel.text = movie.rateLabelText
        rateLabel.font = .systemFont(ofSize: 12)
        rateLabel.textColor = .darkGray
        memoTextView.text = ""
        setInfoBackgroundView()
    }
    
    func setInfoBackgroundView(){
        infoBackgroundView.layer.cornerRadius = 8
        infoBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    
    func setNavigationBar(){
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.topItem?.title = ""
        
    }


}
