//
//  ViewController.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/07/31.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var contentLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setProperties()
    }
    
    func setNavigationBar(){
        title = "검색 화면"
        let xmark = UIImage(systemName: "xmark")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain, target: self, action: #selector(dismissButtonDidTap))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func dismissButtonDidTap(){
        self.dismiss(animated: true)
    }
    
    func setProperties(){
        contentLabel.text = "검색 화면"
        contentLabel.font = .systemFont(ofSize: 50)
    }



}

