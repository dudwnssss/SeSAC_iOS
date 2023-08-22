//
//  UIButton+.swift
//  CdoeBase
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit.UIButton

extension UIButton {
    
    
    func setKaKaoTopButton(imageString: String) {
        var config = UIButton.Configuration.plain()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .thin)
        config.image = UIImage(systemName: imageString, withConfiguration: imageConfig)
        config.imagePlacement = .top
        config.baseForegroundColor = .white
        self.configuration = config
    }
    
    func setKaKaoBottomButton(imageString: String, title: String){
        var titleContainer = AttributeContainer()
        titleContainer.font = UIFont.systemFont(ofSize: 13)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: imageString)
        config.imagePlacement = .top
        config.imagePadding = 10
        config.attributedTitle = AttributedString(title, attributes: titleContainer)
        config.baseForegroundColor = .white
        self.configuration = config
    }
}
