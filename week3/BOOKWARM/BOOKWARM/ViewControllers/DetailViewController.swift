//
//  DetailViewController.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
        setNavigationBar()
    }
    
    func setProperties(){
        contentLabel.text = "상세 화면"
        contentLabel.font = .systemFont(ofSize: 50)
    }
    
    func setNavigationBar(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
    }


}
