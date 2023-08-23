//
//  TrendViewController.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//

import UIKit
import Kingfisher

class TrendViewController : UIViewController{
    
    @IBOutlet var trendTableView: UITableView!
    

    
    var list = Trend(page: 0, results: [], totalPages: 0, totalResults: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setProperties()
        
        TrendManager.shared.callRequest { data in
            self.list = data
            print(data)
            
            self.trendTableView.reloadData()
        } failure: {
            print("에러")
        }
    }
    
    func setNavigationBar(){
        let listImage = UIImage(systemName: "list.bullet")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: listImage, style: .plain, target: self, action: nil)
        let searchImage = UIImage(systemName: "magnifyingglass")
        let searchItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: nil)
        let locationImage = UIImage(systemName: "location.circle")
        let locationItem = UIBarButtonItem(image: locationImage, style: .plain, target: self, action: #selector(locationButtonDidTap))
        
        navigationItem.rightBarButtonItems = [searchItem, locationItem]
        
        
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
    
    func setProperties(){
        setNavigationBar()
        trendTableView.delegate = self
        trendTableView.dataSource = self
        trendTableView.separatorStyle = .none
        trendTableView.rowHeight = 450
    }
    
    func registerCell(){
        let nib = UINib(nibName: TrendTableViewCell.identifier, bundle: nil)
        trendTableView.register(nib, forCellReuseIdentifier: TrendTableViewCell.identifier)
    }
}

extension TrendViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TrendTableViewCell.identifier) as? TrendTableViewCell else{
            return UITableViewCell()
        }
        let row = list.results[indexPath.row]
        cell.titleLabel.text = row.title
        cell.originalTitleLabel.text = row.originalTitle
        
        cell.dateLabel.text = row.date
        
        if let genre = Genre.genreList[row.genreIDS[0]] {
            cell.genreLabel.text = "#\(genre)"
        }
       
        cell.rateScoreLabel.text = row.rate
        
        let url = URLConstant.imageBaseURL + (row.backdropPath)
        cell.posterImageView.kf.setImage(with: URL(string: url))
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: CreditViewController.identifier, bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: CreditViewController.identifier) as? CreditViewController else {return}
        
        vc.movieInfo = list.results[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

