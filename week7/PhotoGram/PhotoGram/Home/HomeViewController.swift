//
//  HomeViewController.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/31.
//

import UIKit

//AnyObject: 클래스에서만 프로토콜을 정의할 수 있도록 제약
//protocol A: AnyObject{
//    func a()
//}
//
//struct B: A {
//    func a(){
//
//    }
//}
//
//class C: A {
//    func a(){
//
//    }
//}


protocol HomeViewProtocol: AnyObject {
    func didSeletecItemAt(indexPath: IndexPath)
}

class HomeViewController: BaseViewController {
    
    var list: Photo = Photo(total: 0, totalPages: 0, results: [])

    let homeView = HomeView()

    
    override func loadView() {
       //view안에 요소를 빼 올일이 없어서 loodView안으로 가져옴
        homeView.delegate = self
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self, #function)
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
        
        APIService.shared.callRequest(query: "sky") { photo in
            guard let photo = photo else {
                print("ALERT ERROR")
                return
            }
            print("API END")
            self.list = photo
            self.homeView.collectionView.reloadData()
        }
    }
    
    deinit {
            print("deinit", self)
    }
    
    
}

extension HomeViewController: HomeViewProtocol {
    func didSeletecItemAt(indexPath: IndexPath) {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(#function)
        return list.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(#function)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else {return UICollectionViewCell()}
        cell.imageView.backgroundColor = .systemBlue
        
        let thumb = list.results[indexPath.item].urls.thumb
        let url = URL(string: thumb) //링크를 기반으로 이미지를 보여준다? >>> 네트워크 통신임!!!
        
        
        
        DispatchQueue.global().async {
            let data = try! Data(contentsOf: url!) //동기 코드
            DispatchQueue.main.sync {
                cell.imageView.image = UIImage(data: data)

            }
        }

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
//        delegate?.didSeletecItemAt(indexPath: indexPath)
    }
    
}
