//
//  secondTabViewController.swift
//  first
//
//  Created by 임영준 on 2023/07/27.
//

import UIKit

class secondTabViewController: UIViewController {

    //코드를 줄이고, 클래스의 인스턴스로 만들어서 좀 더 효율적
    
    let userDefaults = UserDefaults.standard
    
    
    @IBOutlet var resultLabel: UILabel!
    
    //탭바 컨트롤러: 탭 클릭 전까지 ViewDidLoad는 호출되지 않음
    override func viewDidLoad() {
        super.viewDidLoad()

        let count = UserDefaults.standard.integer(forKey: "count")
        resultLabel.text = "\(count)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let count = UserDefaults.standard.integer(forKey: "count")
        resultLabel.text = "\(count)"
    }
    
}
