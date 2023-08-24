//
//  ViewController.swift
//  Jackflix_CodeBase
//
//  Created by 임영준 on 2023/08/24.
//

import UIKit
import SnapKit
import Then

class BaseViewController: UIViewController {
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setProperties()
        setLayouts()
    }
    
    func setLayouts(){}
    
    func setProperties(){}
    
}


