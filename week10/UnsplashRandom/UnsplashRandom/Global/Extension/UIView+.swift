//
//  UIView+.swift
//  UnsplashRandom
//
//  Created by 임영준 on 2023/09/18.
//

import UIKit.UIView

extension UIView{
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    
    func addSubViews(_ views: UIView...){
        for view in views{
            addSubview(view)
        }
    }
    
}
