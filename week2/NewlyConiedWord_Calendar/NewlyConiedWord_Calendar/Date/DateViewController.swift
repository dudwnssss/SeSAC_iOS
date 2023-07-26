//
//  DateViewController.swift
//  NewlyConiedWord_Calendar
//
//  Created by 임영준 on 2023/07/20.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet var viewNoSubview: UIView!
    @IBOutlet var viewWithSubView: UIView!
    
    
    let ddays = [100, 200, 300, 400]
    let images = ["donut", "birthday", "steak", "icecream"]
    
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var background100ImageView: UIImageView!
    @IBOutlet var date100Label: UILabel!
    
    
    @IBOutlet var ddayLabels: [UILabel]!
    @IBOutlet var dateLabels: [UILabel]!
    @IBOutlet var backgroundImages: [UIImageView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewNoSubview.backgroundColor = .brown
        addShadow(view: viewWithSubView)
        addShadow(view: viewNoSubview)
        
        setDatePicker()
//        testViewProperty()
        setProperties()
        datePickerValueChanged(datePicker)
    }

    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
//        print(sender.date)
//        //+100일 뒤
//        let result = Calendar.current.date(byAdding: .day, value: 100, to: sender.date)
//        print(result)
//
//        //DateFormatter: 1. 시간대 변경 2. 날짜 포맷 변경
//        let format = DateFormatter()
//        format.dateFormat = "MM월 dd일, yyyy년"
//        let value = format.string(from: result!)
//        print(value)
//
//        date100Label.text = value
        
        for i in 0...ddays.count - 1{
            ddayLabels[i].text = "D + \(ddays[i])"
            backgroundImages[i].image = UIImage(named: "\(images[i])")
            dateLabels[i].text = getDate(date: sender.date, dday: ddays[i])
        }
    }
    
    func getDate(date: Date, dday: Int) -> String{
        let result = Calendar.current.date(byAdding: .day, value: dday, to: date)!
        let format = DateFormatter()
        format.dateFormat = "yyyy년 M월 d일"
        let value = format.string(from: result)
        return value
    }
    
    func addShadow(view: UIView){
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.5
        view.clipsToBounds = false //false로 줘야 하는데, 그럼 radius가 적용이 안됨
    }
    
    func addShadow(image: UIImageView){
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = .zero
        image.layer.shadowRadius = 10
        image.layer.shadowOpacity = 0.5
        image.clipsToBounds = true //false로 줘야 하는데, 그럼 radius가 적용이 안됨
    }
    
    func setProperties(){
        for item in ddayLabels{
            item.textColor = .white
            item.backgroundColor = .blue
        }
        for item in dateLabels{
            item.textColor = .white
            item.textAlignment = .center
        }
        
        for item in backgroundImages{
            item.contentMode = .scaleAspectFill
            item.layer.cornerRadius = 10
            addShadow(image: item)
        }
    }
    
    
    
    func testViewProperty(){
        background100ImageView.backgroundColor = .brown
    
        //Shadow
        background100ImageView.layer.shadowColor = UIColor.black.cgColor
        background100ImageView.layer.shadowOffset = .zero
//        background100ImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        //햇빛이 비치는 방향
        
        background100ImageView.layer.shadowRadius = 10
        //퍼짐의 정도 (숫자가 클수록 많이 퍼짐)
        background100ImageView.layer.shadowOpacity = 0.5
        //불투명도
        background100ImageView.clipsToBounds = false
        
        
        date100Label.backgroundColor = .brown
        date100Label.layer.cornerRadius = 20
        date100Label.clipsToBounds = true
    }
    
    
    func setDatePicker(){
        
        datePicker.tintColor = .systemPink
        
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
}
