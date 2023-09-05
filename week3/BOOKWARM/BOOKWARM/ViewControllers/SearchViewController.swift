//
//  ViewController.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/07/31.
//

import UIKit
import Kingfisher
import RealmSwift
import Then

class SearchViewController: UIViewController {
    
    var startPage = SearchBookManager.shared.startPage
    var totalCount = SearchBookManager.shared.totalCount
    
    let searchController = UISearchController(searchResultsController: nil).then{
        $0.searchBar.placeholder = "찾고싶은 도서를 입력하세요"
    }
    
    let realm = try! Realm()
    
    var bookList : [Document] = []{
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
    
    func addBookToRealm(index: Int){
        let book = bookList[index]
        let authors = book.authors.joined(separator: ",")
        
        let task = MyBookInfo(title: book.title, thumb: book.thumbnail, overView: book.contents, date: book.datetime, author: authors, price: book.price)
        
        try! realm.write{
            realm.add(task)
        }
        
        DispatchQueue.global().async {
            if let url = URL(string: book.thumbnail), let data = try? Data(contentsOf: url ) {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.saveImageToDocument(fileName: "\(task._id).jpg", image: image!)
                }
            }
        }
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
        collectionView.prefetchDataSource = self
        
    }
    
    func presentAlert(index: Int){
        let alert = UIAlertController(title: "내 도서 목록에 추가하시겠습니까?", message: nil, preferredStyle: .alert)
        let add = UIAlertAction(title: "추가", style: .default) { _ in
            self.addBookToRealm(index: index)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(add)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func setSearchController(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
}

extension SearchViewController : UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
//        dump(searchController.searchBar.text)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        SearchBookManager.shared.callRequest(query: searchBar.text ?? "") { value in
            self.bookList = value.documents
            SearchBookManager.shared.totalCount = value.meta.totalCount
        }
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if bookList.count - 1 == indexPath.item && bookList.count < SearchBookManager.shared.totalCount {
                SearchBookManager.shared.startPage += 1
                SearchBookManager.shared.callRequest(query: searchController.searchBar.text ?? "") { value in
                    self.bookList.append(contentsOf: value.documents)
                print("callRequest Called")
                }
            }
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
//        print("canceled")
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookWarmCell.identifier, for: indexPath) as? BookWarmCell else{
            return UICollectionViewCell()
        }
        let row = bookList[indexPath.row]
        cell.titleLabel.text = row.title
        let url = URL(string: row.thumbnail)
        cell.posterImageView.kf.setImage(with: url)
        cell.rateLabel.text = row.datetime
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentAlert(index: indexPath.row)
    }
    
    
}
