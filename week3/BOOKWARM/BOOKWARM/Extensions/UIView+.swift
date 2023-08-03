//
//  UIView+.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit.UIView

extension UIImageView {
    func configureRoundedView(){
        clipsToBounds = true
        layer.cornerRadius = 8
    }
}
