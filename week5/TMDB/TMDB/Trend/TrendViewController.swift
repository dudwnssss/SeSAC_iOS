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
    
    let genreList = [28: "Action", 12: "Adventure", 16: "Animation", 35: "Comedy", 80: "Crime", 99: "Documentary", 18: "Drama", 10751: "Family", 14: "Fanasy", 36: "History", 27: "Horror", 10402: "Music", 9648: "Mystery", 10749: "Romance", 878: "Science Fiction", 10770: "TV Movie", 53: "Thriller", 10752: "War", 37: "Western"]
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
    
    
    func setProperties(){
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
        cell.dateLabel.text = row.releaseDate//datefomatter쓰자
        
        if let genre = genreList[row.genreIDS[0]] {
            cell.genreLabel.text = "#\(genre)"
        }
        let digit: Double = pow(10, 1)
        let score = floor(row.voteAverage * digit) / digit
        
        cell.rateScoreLabel.text = "\(score)" //버림하자
        let url = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2\(row.backdropPath)"
        cell.posterImageView.kf.setImage(with: URL(string: url))
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: CreditViewController.identifier, bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: CreditViewController.identifier) as? CreditViewController else {return}
        
        vc.movieInfo = list.results[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

