//
//  UIView+.swift
//  CdoeBase
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit.UIView

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
