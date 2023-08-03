//
//  BrowseViewController.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit

class BrowseViewController: UIViewController {

    let movieInfo = MovieInfo()
    @IBOutlet var headerTitleLabel: UILabel!
    @IBOutlet var browseCollectionView: UICollectionView!
    @IBOutlet var browseTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
        registerCells()
        setCollectionViewLayout()
        browseTableView.dataSource = self
        browseTableView.delegate = self
        browseCollectionView.dataSource = self
        browseCollectionView.delegate = self
    }
    
    func registerCells(){
        let tvNib = UINib(nibName: BrowseTableViewCell.identifier, bundle: nil)
        browseTableView.register(tvNib, forCellReuseIdentifier: BrowseTableViewCell.identifier)
        
        let cvNib = UINib(nibName: BrowseCollectionViewCell.identifier, bundle: nil)
        browseCollectionView.register(cvNib, forCellWithReuseIdentifier: BrowseCollectionViewCell.identifier)
    }
    
    func setCollectionViewLayout(){
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let ratio: Double = 361/240
        let width = UIScreen.main.bounds.width - (spacing * 5)
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: width/4, height: (width/4)*ratio
        )
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        browseCollectionView.collectionViewLayout = layout
    }
    
    func setProperties(){
        title = "둘러보기"
        headerTitleLabel.text = "최근 본 작품"
        headerTitleLabel.font = .boldSystemFont(ofSize: 16)
        headerTitleLabel.textColor = .gray
        browseTableView.rowHeight = 100
        browseCollectionView.showsHorizontalScrollIndicator = false
        //separatorInset
//        browseTableView.separatorInset = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
    }
    
    func presentDetailVC(row: Int){
        guard let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else{
            return
        }
        vc.movie = movieInfo.movie[row]
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

extension BrowseViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "요즘 인기작품"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfo.movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BrowseTableViewCell.identifier) as? BrowseTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(row: movieInfo.movie[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentDetailVC(row: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
}

extension BrowseViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieInfo.movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrowseCollectionViewCell.identifier, for: indexPath) as? BrowseCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(row: movieInfo.movie[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentDetailVC(row: indexPath.row)
    }
    
}
