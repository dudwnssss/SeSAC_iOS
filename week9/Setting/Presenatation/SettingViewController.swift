//
//  ViewController.swift
//  Setting
//
//  Created by 임영준 on 2023/09/15.
//

import UIKit

class SettingViewController: UIViewController {
    
    let settingView = SettingView()

    
    
    override func loadView() {
        self.view = settingView
    }
    
 
}

