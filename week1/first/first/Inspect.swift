//
//  Inspect.swift
//  first
//
//  Created by 임영준 on 2023/07/18.
//

import UIKit

//인터페이스 빌더에서 디자인으로 확인 가능하게끔
@IBDesignable

class CustomView : UIImageView {
    
    @IBInspectable //inspector 패널에서 사용될 수 있도록 설정
    var  cornerRadius : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var borderWidth : CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor : UIColor = UIColor.clear {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
