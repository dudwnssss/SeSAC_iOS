//
//  DateViewController.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/29.
//

import UIKit

class DateViewController: BaseViewController {
    
    
    let dateView = DateView()
    //Protocol 값 전달 2.
    var delegate: PassDataDelegate?
    
    override func loadView() {
        self.view = dateView
    }
    
    //Protocol 값 전달 3.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.recieveDate(date: dateView.datePicker.date)
    }
    
}


