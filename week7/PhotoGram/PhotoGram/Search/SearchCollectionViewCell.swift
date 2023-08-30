//
//  SearchCollectionViewCell.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class SearchCollectionViewCell: BaseCollectionViewCell {
    
    let imageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleToFill
        return view
    }()
    
    override func setProperties() {
        contentView.addSubview(imageView)
    }
    override func setLayouts() {
        imageView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
    
}
