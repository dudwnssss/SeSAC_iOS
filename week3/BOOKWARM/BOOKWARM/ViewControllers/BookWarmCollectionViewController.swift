//
//  BookWarmCollectionViewController.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/07/31.
//

import UIKit


class BookWarmCollectionViewController: UICollectionViewController {

    
    let movieInfo = MovieInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        registerCell()
        setCollectionViewLayout()
    }
    
    func setNavigationBar(){
        title = "고래밥님의 책장"
        let searchImage = UIImage(systemName: "magnifyingglass")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(searchButtonDidTap))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    func registerCell(){
        let nib = UINib(nibName: "BookWarmCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: BookWarmCell.identifier)
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
        movieInfo.movie.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookWarmCell.identifier, for: indexPath) as? BookWarmCell else{
            print("wrong identifier")
            return UICollectionViewCell()
        }
        
        let row = movieInfo.movie[indexPath.row]
        cell.configureCell(row: row)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController")
        vc.title = movieInfo.movie[indexPath.row].title
        navigationController?.pushViewController(vc, animated: true)
    }
}


