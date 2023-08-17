//
//  CreditViewController.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//




import UIKit
import Alamofire

class CreditViewController : UIViewController{
    
    @IBOutlet var backgroundPosterImageView: UIImageView!
    @IBOutlet var mainPosterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var castTableView: UITableView!
    
    var movieInfo : Result?
    
    enum cellType: Int, CaseIterable{
        case overview, cast
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
        registerCell()
    }
    
    func setProperties(){
        setNavigationBar()
        castTableView.dataSource = self
        castTableView.delegate = self
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textColor = .white
        titleLabel.text = movieInfo?.title
        
        backgroundPosterImageView.backgroundColor = .black
        let bgImageUrl = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2\(movieInfo?.backdropPath)"
        let mainImageurl = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2\(movieInfo?.posterPath)"
        mainPosterImageView.backgroundColor = .brown
        
        backgroundPosterImageView.kf
    }
    
    func registerCell(){
        let overviewNib = UINib(nibName: OverViewTableViewCell.identifier, bundle: nil)
        castTableView.register(overviewNib, forCellReuseIdentifier: OverViewTableViewCell.identifier)
        let castNib = UINib(nibName: CastTableViewCell.identifier, bundle: nil)
        castTableView.register(castNib, forCellReuseIdentifier: CastTableViewCell.identifier)
    }
    
    func setNavigationBar(){
        title = "출연/제작"
    }
}

extension CreditViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch cellType(rawValue: section){
        case .overview:
            return 1
        case .cast:
            return 10 //배우 수
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        guard let overviewCell = tableView.dequeueReusableCell(withIdentifier: OverViewTableViewCell.identifier) as? OverViewTableViewCell else {
            return UITableViewCell()
        }
        overviewCell.overviewLabel.text = movieInfo?.overview
        
        
        
        guard let castCell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.identifier) as? CastTableViewCell else {
            return UITableViewCell()
        }
        switch cellType(rawValue: indexPath.row){
        case .overview:
            return overviewCell
        case .cast:
            return castCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch cellType(rawValue: indexPath.row){
        case .overview:
            return 100
        case .cast:
            return 70
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch cellType(rawValue: section){
        case .overview:
            return "OverView"
        case .cast:
            return "Cast"
        default:
            return nil
        }
    }
    
}
