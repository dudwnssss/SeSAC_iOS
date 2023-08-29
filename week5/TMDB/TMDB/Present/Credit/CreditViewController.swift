//
//  CreditViewController.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//




import UIKit
import Alamofire

class CreditViewController : BaseViewController{
    
    var isMoreButtonTapped = false {
        didSet {
            castTableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .none)
        }
    }
    
    let backgroundPosterImageView = UIImageView().then{
        $0.contentMode = .scaleAspectFill
    }
    let mainPosterImageView = UIImageView()
    
    let titleLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 18, weight: UIFont.Weight(0.5))
        $0.textColor = .white
    }
    
    lazy var castTableView = UITableView().then{
        $0.dataSource = self
        $0.delegate = self
        $0.rowHeight = UITableView.automaticDimension
        $0.register(OverViewTableViewCell.self, forCellReuseIdentifier: OverViewTableViewCell.identifier)
        $0.register(CastTableViewCell.self, forCellReuseIdentifier: CastTableViewCell.identifier)
    }
    
        
    var movieInfo : Result!
    //문제
    var creditInfo : Credit?
    
    
    enum cellType: Int, CaseIterable{
        case overview = 0
        case cast = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
        setCredits()
    }
    
    func setCredits(){
        CastManager.shared.callRequest(id: movieInfo.id ) { data in
            self.creditInfo = data
            self.castTableView.reloadData()
        } failure: {
            print("에러")
        }

    }
    
    override func setProperties(){
        setNavigationBar()

        titleLabel.text = movieInfo.title
       
        let bgImageUrl = URLConstant.imageBaseURL + (movieInfo.backdropPath )
        let mainImageurl = URLConstant.imageBaseURL + (movieInfo.posterPath )
       
        backgroundPosterImageView.kf.setImage(with: URL(string: bgImageUrl))
        mainPosterImageView.kf.setImage(with: URL(string: mainImageurl))
        
    }
    
    override func setLayouts() {
        view.addSubviews(mainPosterImageView, titleLabel, backgroundPosterImageView, castTableView)
        backgroundPosterImageView.snp.makeConstraints{
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalToSuperview().multipliedBy(0.25)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().inset(24)
        }
        mainPosterImageView.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalTo(backgroundPosterImageView)
            $0.width.equalTo(backgroundPosterImageView).multipliedBy(0.25)
            $0.height.equalTo(mainPosterImageView.snp.width).multipliedBy(1.6)
        }
        castTableView.snp.makeConstraints {
            $0.top.equalTo(backgroundPosterImageView.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
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
        overviewCell.overviewLabel.text = movieInfo.overview
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
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
          return UITableView.automaticDimension
    }
    
}
