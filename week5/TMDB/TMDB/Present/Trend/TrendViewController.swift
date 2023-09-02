//
//  TrendViewController.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//

import UIKit
import Kingfisher

class TrendViewController : BaseViewController{
    
    let trendView = TrendView()
    
    override func loadView() {
        self.view = trendView
    }
    
//    var list = Movie(page: 0, results: [], totalPages: 0, totalResults: 0)
    var allList = All(page: 0, results: [], totalPages: 0, totalResults: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        TrendManager.shared.callAllRequest { value in
//            self.allList = value
//            self.trendView.trendTableView.reloadData()
//        }
        
        
        TrendManager.shared.callURLSecssionRequest { value in
            self.allList = value ?? All(page: 0, results: [], totalPages: 0, totalResults: 0)
            self.trendView.trendTableView.reloadData()
        }
    }
    
    func setNavigationBar(){
        let listImage = UIImage(systemName: "list.bullet")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: listImage, style: .plain, target: self, action: nil)
        let searchImage = UIImage(systemName: "magnifyingglass")
        let searchItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: nil)
        let locationImage = UIImage(systemName: "location.circle")
        let locationItem = UIBarButtonItem(image: locationImage, style: .plain, target: self, action: #selector(locationButtonDidTap))
        let profileImage = UIImage(systemName: "person.circle")
        let profileItem = UIBarButtonItem(image: profileImage, style: .plain, target: self, action: #selector(profileButtonDidTap))
        
        navigationItem.rightBarButtonItems = [searchItem, locationItem, profileItem]
        
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    @objc func locationButtonDidTap(){
        let vc = LocationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func profileButtonDidTap(){
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func setProperties(){
        setNavigationBar()
        trendView.trendTableView.delegate = self
        trendView.trendTableView.dataSource = self
    }
    
    
    
}

extension TrendViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allList.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell else{ return UITableViewCell()}
        guard let tvCell = tableView.dequeueReusableCell(withIdentifier: TVTableViewCell.identifier) as? TVTableViewCell else {return UITableViewCell()}
        guard let personCell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier) as?
                PersonTableViewCell else {return UITableViewCell()}
        
        
        let row = allList.results[indexPath.row]
        
        switch row.mediaType {
        case .tv:
            if let title = row.name {
                tvCell.titleLabel.text = title
            }
            if let originalTitle = row.originalName{
                tvCell.originalTitleLabel.text = originalTitle
            }
            tvCell.rateScoreLabel.text = row.rate
            let url = URLConstant.imageBaseURL + (row.backdropPath)
            tvCell.posterImageView.kf.setImage(with: URL(string: url))
            
            return tvCell
            
        case .movie:
            movieCell.titleLabel.text = row.title
            movieCell.originalTitleLabel.text = row.originalTitle
            movieCell.dateLabel.text = row.date
            
            if let genre = Genre.genreList[row.genreIDS[0]] {
                movieCell.genreLabel.text = "#\(genre)"
            }
            movieCell.rateScoreLabel.text = row.rate
            let url = URLConstant.imageBaseURL + (row.backdropPath)
            movieCell.posterImageView.kf.setImage(with: URL(string: url))
            return movieCell
            
        case .person:
            return personCell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = allList.results[indexPath.row]
        
        switch row.mediaType {
        case .tv:
            let vc = CreditViewController()
            vc.mediaInfo = allList.results[indexPath.row]
            vc.creditView.titleLabel.text = vc.mediaInfo.name
            navigationController?.pushViewController(vc, animated: true)
            
        case .movie:
            let vc = CreditViewController()
            vc.mediaInfo = allList.results[indexPath.row]
            vc.creditView.titleLabel.text = vc.mediaInfo.title
            navigationController?.pushViewController(vc, animated: true)
        case .person:
            print(row.mediaType)
        }

//        let vc = CreditViewController()
//        vc.movieInfo = allList.results[indexPath.row]
//        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

