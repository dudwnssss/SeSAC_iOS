//
//  BaminViewController.swift
//  NewlyConiedWord_Calendar
//
//  Created by 임영준 on 2023/07/23.
//

import UIKit

class BaminViewController: UIViewController {

    
    @IBOutlet var titleLabels: [UILabel]!
    @IBOutlet var contentLabels: [UILabel]!
    @IBOutlet var backgroundViews: [UIView]!
    
    @IBOutlet var searchBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red] // 색상을 원하는 값으로 변경하세요.

    }
    
    func setProperties(){
        searchBackgroundView.layer.cornerRadius = 8
        searchBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        searchBackgroundView.layer.masksToBounds = true
        
        setBackgoundViewProperties()
        setTitleLabels()
        setContentLabels()
        setNavigationBar()

    }
    
    func setNavigationBar(){
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    
    func setBackgoundViewProperties(){
        for item in backgroundViews{
            item.layer.cornerRadius = 8
        }
    }
    
    func setTitleLabels(){
        for item in titleLabels{
            item.font = .boldSystemFont(ofSize: 18)
        }
    }
    
    func setContentLabels(){
        for item in contentLabels{
            item.font = .systemFont(ofSize: 14)
            item.textColor = .darkGray
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
