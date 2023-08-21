//
//  CreditViewController.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//




import UIKit
import Alamofire

class CreditViewController : UIViewController{
    
    var isMoreButtonTapped = false {
        didSet {
            castTableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
    
    @IBOutlet var backgroundPosterImageView: UIImageView!
    @IBOutlet var mainPosterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var castTableView: UITableView!
    
    var movieInfo : Result?
    var creditInfo : Credit?
    
    
    enum cellType: Int, CaseIterable{
        case overview = 0
        case cast = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
        registerCell()
        setCredits()
    }
    
    func setCredits(){
        CastManager.shared.callRequest(id: movieInfo?.id ?? 0) { data in
            self.creditInfo = data
            self.castTableView.reloadData()
        } failure: {
            print("에러")
        }

    }
    
    func setProperties(){
        setNavigationBar()
        castTableView.dataSource = self
        castTableView.delegate = self
        castTableView.rowHeight = UITableView.automaticDimension
        titleLabel.font = .systemFont(ofSize: 18, weight: UIFont.Weight(0.5))
        titleLabel.textColor = .white
        titleLabel.text = movieInfo?.title
       
        let bgImageUrl = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2\(movieInfo?.backdropPath ?? "")"
        let mainImageurl = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2\(movieInfo?.posterPath ?? "")"
       
        backgroundPosterImageView.kf.setImage(with: URL(string: bgImageUrl))
        mainPosterImageView.kf.setImage(with: URL(string: mainImageurl))
        
        backgroundPosterImageView.contentMode = .scaleAspectFill
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
    
    @objc func moreButtonDidTap(){
        isMoreButtonTapped.toggle()
        print(#fileID, #function, #line, "- ")
    }
}

extension CreditViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : creditInfo?.cast.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let overviewCell = tableView.dequeueReusableCell(withIdentifier: OverViewTableViewCell.identifier) as? OverViewTableViewCell else {return UITableViewCell()}
        guard let castCell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.identifier) as? CastTableViewCell else {return UITableViewCell()}
        let profileImageUrl = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2\(creditInfo?.cast[indexPath.row].profilePath ?? "")"
        overviewCell.overviewLabel.text = movieInfo?.overview
        overviewCell.moreButton.addTarget(self, action: #selector(moreButtonDidTap), for: .touchUpInside)
        overviewCell.configureCell(isMore: isMoreButtonTapped)
        
        
        castCell.actorNameLabel.text = creditInfo?.cast[indexPath.row].name
        castCell.characterLabel.text = creditInfo?.cast[indexPath.row].character
        castCell.actorImageView.kf.setImage(with: URL(string: profileImageUrl))
        
        
        return indexPath.section == 0 ? overviewCell : castCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? tableView.estimatedRowHeight : 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "OverView" : "Cast"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
          return UITableView.automaticDimension
    }
    
}
