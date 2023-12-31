//
//  BaseCollectionViewCell.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProperties(){}
    func setLayouts(){}
}
