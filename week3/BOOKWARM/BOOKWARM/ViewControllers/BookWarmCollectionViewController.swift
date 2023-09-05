//
//  BookWarmCollectionViewController.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/07/31.
//

import UIKit
import RealmSwift
import Kingfisher

class BookWarmCollectionViewController: UICollectionViewController {
    
//    var movieInfo = MovieInfo()
    
    
    var tasks: Results<MyBookInfo>?
    let realm = try! Realm()

//    var searchedMovies : [Movie] = []{
//        didSet{
//            collectionView.reloadData()
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    let searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "검색어를 입력하세요"
        return searchBar
    }()
    
    func readBookRealm(){
        tasks = realm.objects(MyBookInfo.self).sorted(byKeyPath: "title", ascending: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        readBookRealm()
        registerCell()
        setCollectionViewLayout()
//        searchedMovies = movieInfo.movie
        searchBar.delegate = self
        hideKeyboardWhenTappedAround()
        print(realm.configuration.fileURL)
    }
    
//    func searchQuery(text: String){
//        if text.isEmpty {
//            searchedMovies = movieInfo.movie
//        }
//        else{
//            searchedMovies.removeAll()
//            for item in movieInfo.movie {
//                if item.title.contains(text){
//                    searchedMovies.append(item)
//                }
//            }
//        }
//    }
    
    
    func setNavigationBar(){
        let searchImage = UIImage(systemName: "magnifyingglass")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(searchButtonDidTap))
        navigationItem.rightBarButtonItem?.tintColor = .black
        title = "고래밥님의 책장"
//        navigationItem.titleView = searchBar
    }
    
    func registerCell(){
        let nib = UINib(nibName: "BookWarmCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: BookWarmCell.identifier)
    }
    
//    @objc func likeButtonDidTap(_ sender: UIButton){
//        searchedMovies[sender.tag].like.toggle()
//
//        //원본 list에서 제목을 통해 영화를 찾고,
//        let title = searchedMovies[sender.tag].title
//
//        //그 영화의 인덱스를 통해 list[sender.tag].like.toggle()를 해줘야 함
//        for (index,item) in movieInfo.movie.enumerated(){
//            if item.title == title{
//                movieInfo.movie[index].like.toggle()
//            }
//        }
//    }
            
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
    
    @objc func searchButtonDidTap(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SearchViewController")
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
        
    }
}

extension BookWarmCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tasks?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookWarmCell.identifier, for: indexPath) as? BookWarmCell else{
            print("wrong identifier")
            return UICollectionViewCell()
        }
        
        if let row = tasks?[indexPath.row] {
            let image = loadImageFromDocument(fileName: "\(row._id).jpg")
            cell.posterImageView.image = image
            cell.titleLabel.text = row.title
            cell.rateLabel.text = row.author
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else{
            return
        }
        vc.myBookInfo = tasks?[indexPath.row]
        vc.isNav = true
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension BookWarmCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else {return}
//        searchQuery(text: searchBarText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true

    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchedMovies = movieInfo.movie
        searchBar.text = ""
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchBarText = searchBar.text else {return}
//        searchQuery(text: searchBarText)
    }
}
