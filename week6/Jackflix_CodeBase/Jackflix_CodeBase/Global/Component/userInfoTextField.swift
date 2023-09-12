//
//  userInfoButton.swift
//  Jackflix_CodeBase
//
//  Created by 임영준 on 2023/08/24.
//

import UIKit

class userInfoTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProperties(){
        layer.cornerRadius = 4
        backgroundColor = .darkGray
        textAlignment = .center
        textColor = .white
    }
}
