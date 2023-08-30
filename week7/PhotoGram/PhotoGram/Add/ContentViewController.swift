//
//  ContentViewController.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/29.
//


import UIKit

class ContentViewController: BaseViewController{
    let textView = {
        let view = UITextView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    //Closure - 1
    var completionHandler: ((String) -> ())?
    
    override func setLayouts() {
        view.addSubview(textView)
        textView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(250)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //Closuer - 2
        completionHandler?(textView.text!)
    }
}
