//
//  ReusableView.swift
//  ShoppingList
//
//  Created by 임영준 on 2023/09/07.
//

import UIKit.UIView

protocol ReusableView: AnyObject{}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
