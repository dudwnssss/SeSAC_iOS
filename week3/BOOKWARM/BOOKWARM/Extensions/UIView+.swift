//
//  UIView+.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/08/02.
//

import UIKit

extension UIView {
    func configureRoundedView(){
        clipsToBounds = true
        layer.masksToBounds = true
        layer.cornerRadius = 8
    }
}
