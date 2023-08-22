//
//  ViewController.swift
//  CdoeBase
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit
import SnapKit

class Example1ViewController: UIViewController {

    let grayView : UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    let titleTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "제목을 입력해주세요"
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.textAlignment = .center
        return view
    }()
    let dateTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "날짜를 입력해주세요"
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.textAlignment = .center
        return view
    }()
    let textView: UITextView = {
        let view = UITextView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayouts()
    }
    
    func setLayouts(){
        view.addSubviews(grayView, titleTextField, dateTextField, textView)
        
        grayView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.3)
        }
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(grayView.snp.bottom).offset(20)
            $0.height.equalTo(44)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        dateTextField.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(20)
            $0.height.equalTo(44)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        textView.snp.makeConstraints {
            $0.top.equalTo(dateTextField.snp.bottom).offset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
    }

}

