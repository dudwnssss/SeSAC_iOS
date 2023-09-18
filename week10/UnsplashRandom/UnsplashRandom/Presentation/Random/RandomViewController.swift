//
//  ViewController.swift
//  UnsplashRandom
//
//  Created by 임영준 on 2023/09/18.
//

import UIKit

class RandomViewController: BaseViewController {
    
    let randomView = RandomView()
    let randomViewModel = RandomViewModel()
    
    var dataSource: UICollectionViewDiffableDataSource<Int, Photo>!
    
    override func loadView() {
        self.view = randomView
    }
    
    override func setProperties() {
        randomView.collectionView.delegate = self
        setNavigationBar()
        fetchButtonDidTap()
        setDataSource()
        dump(randomViewModel.photoList)
        randomViewModel.photoList.bind { [weak self] value in
            self?.applySnapshot(data: value)
        }
    }
    func setNavigationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Fetch", style: .plain, target: self, action: #selector(fetchButtonDidTap))
    }
    
    @objc func fetchButtonDidTap(){
        print(#fileID, #function, #line, "- ")
        PhotoManager.shared.fetchRandomPhoto { [weak self] value in
            self?.randomViewModel.photoList.value.insert(value, at: 0)
        }
    }
    
}
extension RandomViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let photo = dataSource.itemIdentifier(for: indexPath) else {return}
        dump(photo)
    }
}


extension RandomViewController{
    func setDataSource(){
        dataSource = UICollectionViewDiffableDataSource(collectionView: randomView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell : RandomCell = collectionView.dequeReusableCell(forIndexPath: indexPath)
            cell.configureCell(photo: itemIdentifier)
            return cell
        })
    }
    
    func applySnapshot(data: [Photo]){
        var snapshot = NSDiffableDataSourceSnapshot<Int, Photo>()
        snapshot.appendSections([0])
        snapshot.appendItems(data)
        dataSource.apply(snapshot)
    }
    
}
