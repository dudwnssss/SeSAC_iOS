//
//  ViewController.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/07/31.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var contentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setProperties()
        setSearchController()
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
        contentLabel.text = "검색 화면"
        contentLabel.font = .systemFont(ofSize: 50)
    }
    
    func setSearchController(){
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "찾고싶은 영화를 입력하세요"
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
    }
}

extension SearchViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        dump(searchController.searchBar.text)
    }
}

