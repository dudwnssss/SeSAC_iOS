//
//  RandomCell.swift
//  UnsplashRandom
//
//  Created by 임영준 on 2023/09/18.
//

import UIKit
import Kingfisher

final class RandomCell: UICollectionViewCell{
    
    let randomImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
        setLayouts()
    }

    func setProperties(){
        randomImageView.do {
            $0.cornerRadius = 8
            $0.backgroundColor = .systemGray4
        }
    }
    
    func setLayouts(){
        contentView.addSubview(randomImageView)
        randomImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureCell(photo: Photo){
        guard let url = URL(string: photo.urls.thumb) else {return}
        randomImageView.kf.setImage(with: url)
    }
    
    override func prepareForReuse() {
        randomImageView.image = nil
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
