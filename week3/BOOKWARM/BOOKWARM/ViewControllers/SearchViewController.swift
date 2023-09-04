//
//  ViewController.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/07/31.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {

    var bookInfo: BookInfo?{
        didSet{
            collectionView.reloadData()
        }
    }
    
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionViewLayout()
        registerCell()
        setNavigationBar()
        setProperties()
        setSearchController()
    }
    
    func setCollectionViewLayout(){
        let layout = UICollectionViewFlowLayout()
        let spacing : CGFloat = 20
        let width = UIScreen.main.bounds.width  - (spacing * 3)
        layout.itemSize = CGSize(width: width/2, height: width/2)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        collectionView.collectionViewLayout = layout
        collectionView.keyboardDismissMode = .onDrag
    }
    
    func registerCell(){
        let nib = UINib(nibName: "BookWarmCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: BookWarmCell.identifier)
    }
    
    func setNavigationBar(){
        title = "검색 화면"
        let xmark = UIImage(systemName: "xmark")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain, target: self, action: #selector(dismissButtonDidTap))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func dismissButtonDidTap(){
        dismiss(animated: true)
    }
    
    func setProperties(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setSearchController(){
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "찾고싶은 영화를 입력하세요"
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
    }
}

extension SearchViewController : UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        dump(searchController.searchBar.text)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        SearchBookManager.shared.callRequest(query: searchBar.text ?? "") { value in
            self.bookInfo = value
        }
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookInfo?.documents.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookWarmCell.identifier, for: indexPath) as? BookWarmCell else{
            return UICollectionViewCell()
        }
        if let row = bookInfo?.documents[indexPath.row] {
            cell.titleLabel.text = row.title
            let url = URL(string: row.thumbnail)
            cell.posterImageView.kf.setImage(with: url)
            cell.rateLabel.text = row.datetime
        }
        return cell
    }
    
}
