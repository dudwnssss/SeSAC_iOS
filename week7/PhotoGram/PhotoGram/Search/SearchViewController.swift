//
//  SearchViewController.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit
import Kingfisher


class SearchViewController: BaseViewController {
    
    var searchedImage : Photo?{
        didSet{
            searchView.collectionView.reloadData()
        }
    }
    let searchView = SearchView()
    var delegate: PassImageDelegate?
    
    
    override func loadView() {
        self.view = searchView
    }
    
    //addObserver보다 post가 먼저 신호를 보내면...
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.searchBar.becomeFirstResponder()
        searchView.searchBar.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(recommandKeywordNotificationObserver(notification:)), name: NSNotification.Name("RecommandKey"), object: nil)
    }
    
    @objc func recommandKeywordNotificationObserver(notification: NSNotification){
        print("recommandKeywordNotificationObserver")
    }

    override func setProperties() {
        super.setProperties()
        searchView.collectionView.delegate = self
        searchView.collectionView.dataSource = self
    }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedImage?.results.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell()}
        let url = URL(string: (searchedImage?.results[indexPath.row].urls.small)!)
        cell.imageView.kf.setImage(with: url)
        return cell
   }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let imageURL = URL(string: (searchedImage?.results[indexPath.row].urls.full)!) else {return}
        delegate?.recieveImageURL(imageURL: imageURL)
        

        navigationController?.popViewController(animated: true)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        SearchImageManager.shared.callRequest(query: searchView.searchBar.text!) { searchedImage in
            self.searchedImage = searchedImage
        } failure: {
            print("에러")
        }

        searchView.searchBar.resignFirstResponder()
    }
}
