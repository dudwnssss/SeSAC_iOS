//
//  UIView+.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/17.
//

import UIKit.UIView

extension UIView{
    func setShadowView(){
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.5
        self.clipsToBounds = false
    }
}


