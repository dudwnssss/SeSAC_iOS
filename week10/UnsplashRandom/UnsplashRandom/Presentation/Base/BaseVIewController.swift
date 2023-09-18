//
//  BaseVIewController.swift
//  UnsplashRandom
//
//  Created by 임영준 on 2023/09/18.
//

import UIKit
import SnapKit
import Then

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setProperties()
        setLayouts()
    }
    
    func setProperties(){}
    func setLayouts(){}
}
