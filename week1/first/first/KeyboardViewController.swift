//
//  KeyboardViewController.swift
//  first
//
//  Created by 임영준 on 2023/07/20.
//

import UIKit

class KeyboardViewController: UIViewController {
    
    @IBOutlet var newButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        newButton.backgroundColor = .blue
        
        var config = UIButton.Configuration.filled() //apple system button
        config.title = "SeSAC 영등포캠퍼스"
        config.subtitle = "로그인 없이 둘러보기"
        //버튼에 여러줄 넣기가 가능해짐
        config.image = UIImage(systemName: "star")
        
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .yellow
        config.imagePadding = 8
        config.imagePlacement = .trailing
        config.titleAlignment = .trailing
        
        config.cornerStyle = .capsule
        newButton.configuration = config
        
        //SFsymbols를 사용할 때
    }
    
    @IBAction func keyboardDismiss(_ sender: Any) {
        view.endEditing(true)
    }
}

