//
//  DescriptionDelegateViewController.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/29.
//

import UIKit

protocol DescriptionDelegate{
    func passDescriptionDelegate(description: String)
}

class DescriptionDelegateViewController: BaseViewController{
    
    var delegate : DescriptionDelegate?
    
    let textField = UITextField().then{
        $0.placeholder = "소개를 입력하세요"
    }
    let underLineView = UIView().then{
        $0.backgroundColor = .lightGray
    }
    
    func setNavigationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(completeButtonDidTap))
    }
    
    @objc func completeButtonDidTap(){
        delegate?.passDescriptionDelegate(description: textField.text!)
        navigationController?.popViewController(animated: true)
    }
    
    override func setProperties() {
        setNavigationBar()
    }
    
    override func setLayouts() {
        view.addSubviews(textField, underLineView)
        textField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        underLineView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.horizontalEdges.equalTo(textField)
            $0.top.equalTo(textField.snp.bottom).offset(2)
        }
        
    }
    
}
