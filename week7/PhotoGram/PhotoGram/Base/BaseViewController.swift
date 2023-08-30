//
//  BaseViewController.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setProperties()
        setLayouts()
    }
    
    func setProperties(){
        print("Base setProperties")
    }
    
    func setLayouts(){
        print("Base setLayouts")
    }

}
