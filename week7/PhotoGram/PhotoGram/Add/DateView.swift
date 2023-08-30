//
//  DateView.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/29.
//

import UIKit

class DateView: BaseView {
    
    let datePicker : UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    override func setLayouts() {
        addSubview(datePicker)
        datePicker.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}

