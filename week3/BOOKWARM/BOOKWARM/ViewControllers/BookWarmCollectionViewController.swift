//
//  BookWarmCollectionViewController.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/07/31.
//

import UIKit


class BookWarmCollectionViewController: UICollectionViewController {
    
    var movieInfo = MovieInfo()
    
    var searchedMovies : [Movie] = []{
        didSet{
            collectionView.reloadData()
        }
    }
    
    let searchBar : UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "검색어를 입력하세요"
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        registerCell()
        setCollectionViewLayout()
        searchedMovies = movieInfo.movie
        searchBar.delegate = self
        hideKeyboardWhenTappedAround()
    }
    
    
    
    func setNavigationBar(){
        let searchImage = UIImage(systemName: "magnifyingglass")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(searchButtonDidTap))
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.titleView = searchBar
    }
    
    func registerCell(){
        let nib = UINib(nibName: "BookWarmCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: BookWarmCell.identifier)
    }
    
    @objc func likeButtonDidTap(_ sender: UIButton){
        searchedMovies[sender.tag].like.toggle()
        print("\(searchedMovies[sender.tag].like)")
        
        for i in 0...movieInfo.movie.count-1{
            if searchedMovies[sender.tag].title == movieInfo.movie[i].title{
                movieInfo.movie[i].like.toggle()
            }
        }
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
        searchedMovies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookWarmCell.identifier, for: indexPath) as? BookWarmCell else{
            print("wrong identifier")
            return UICollectionViewCell()
        }
        
        let row = searchedMovies[indexPath.row]
        cell.configureCell(row: row)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonDidTap), for: .touchUpInside)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else{
            return
        }
        vc.movie = searchedMovies[indexPath.row]
        vc.isNav = true
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension BookWarmCollectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchBarText = searchBar.text else {return}
        if searchBarText.isEmpty {
            searchedMovies = movieInfo.movie
        }
        else{
            searchedMovies.removeAll()
            for item in movieInfo.movie {
                if item.title.contains(searchBar.text!){
                    searchedMovies.append(item)
                }
            }
        }
    }
}
