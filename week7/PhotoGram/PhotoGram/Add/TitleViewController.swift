//
//  TitleViewController.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/29.
//

import UIKit

class TitleViewController: BaseViewController{
    
    let textField = {
        let view = UITextField()
        view.placeholder = "제목을 입력해주세요"
        return view
    }()
    
    //Closure - 1
    var completionHandler: ((String, Int, Bool) -> ())?
    
    func setNavigationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(completeButtonDidTap))
    }
    
    override func setProperties() {
        setNavigationBar()
    }
    
    override func setLayouts() {
        view.addSubview(textField)
        textField.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(50)
        }
    }
    
    @objc func completeButtonDidTap(){
        completionHandler?(textField.text!, 77, false)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        completionHandler?(textField.text!, 100, true)
    }
}
