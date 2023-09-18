//
//  RandomImageVIew.swift
//  UnsplashRandom
//
//  Created by 임영준 on 2023/09/18.
//

import UIKit

class RandomView: BaseView{
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    func createLayout() -> UICollectionViewLayout{
        let spacing: CGFloat = 16
        
        let itemWidth: CGFloat = (UIScreen.main.bounds.width - spacing * 3) / 2
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(itemWidth),
            heightDimension: .fractionalWidth(1/2)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(itemWidth)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = .fixed(spacing)
        group.contentInsets = .init(top: .zero, leading: spacing, bottom: .zero, trailing: spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 24
        section.contentInsets = .init(top: spacing, leading: .zero, bottom: .zero, trailing: .zero)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    override func setProperties() {
        collectionView.do {
            $0.register(cell: RandomCell.self)
        }
    }
    
    override func setLayouts() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
