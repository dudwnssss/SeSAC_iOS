//
//  CreditViewController.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//




import UIKit
import Alamofire

class CreditViewController : BaseViewController{
    
    enum cellType: Int, CaseIterable{
        case overview = 0
        case cast = 1
    }
    
    let creditView = CreditView()
    override func loadView() {
        self.view = creditView
    }
    
    var isMoreButtonTapped = false {
        didSet {
            creditView.castTableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .none)
        }
    }
    
    var mediaInfo : Result!
    //문제
    var creditInfo : Credit?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
        setCredits()
    }
    
    func setCredits(){
        CastManager.shared.callRequest(id: mediaInfo.id ) { data in
            self.creditInfo = data
            self.creditView.castTableView.reloadData()
        } failure: {
            print("에러")
        }

    }
    
    override func setProperties(){
        setNavigationBar()

        creditView.castTableView.dataSource = self
        creditView.castTableView.delegate = self
       
        let bgImageUrl = URLConstant.imageBaseURL + (mediaInfo.backdropPath )
        let mainImageurl = URLConstant.imageBaseURL + (mediaInfo.posterPath )
       
        creditView.backgroundPosterImageView.kf.setImage(with: URL(string: bgImageUrl))
        creditView.mainPosterImageView.kf.setImage(with: URL(string: mainImageurl))
        
    }
    
    
        
    
    

    func setNavigationBar(){
        title = "출연/제작"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
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
        let profileImageUrl = URLConstant.imageBaseURL + (creditInfo?.cast[indexPath.row].profilePath ?? "")
        
        overviewCell.overviewLabel.text = mediaInfo.overview
        overviewCell.moreButton.addTarget(self, action: #selector(moreButtonDidTap), for: .touchUpInside)
        overviewCell.configureCell(isMore: isMoreButtonTapped)
        overviewCell.selectionStyle = .none
        
        castCell.actorNameLabel.text = creditInfo?.cast[indexPath.row].name
        castCell.characterLabel.text = creditInfo?.cast[indexPath.row].character
        castCell.actorImageView.kf.setImage(with: URL(string: profileImageUrl))
        castCell.selectionStyle = .none
        
        
        return indexPath.section == 0 ? overviewCell : castCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? tableView.estimatedRowHeight : 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "OverView" : "Cast"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
          return UITableView.automaticDimension
    }
    
}
