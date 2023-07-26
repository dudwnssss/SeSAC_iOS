//
//  boardViewControlller.swift
//  first
//
//  Created by 임영준 on 2023/07/19.
//

//import Foundation //Swift의 언어 적인 것들이 들어있음
import UIKit //안에 foundation이 들어있음

class BoardViewController: UIViewController{
    
    @IBOutlet var boardTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var tempView: UIView!
    @IBOutlet var testLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for item in testLabel {
            item.textColor = .red
            item.font = .boldSystemFont(ofSize: 15)
        }
        setResultLabel()
        setBoardTextField()
        
    }
    
    @IBAction func textFieldDidTap(_ sender: UITextField) {
//        view.endEditing(true)
    }
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        resultLabel.text = boardTextField.text
        boardTextField.text = ""
    }
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        //키보드 내리기
        view.endEditing(true)
        
        if tempView.isHidden {
            tempView.isHidden = false
        }
        else {
            tempView.isHidden = true
        }
        
    }
    
    func setResultLabel(){
        resultLabel.textAlignment = .center
        resultLabel.text = "안녕하세요"
        resultLabel.font = .boldSystemFont(ofSize: 20)
        resultLabel.textColor = .purple
        resultLabel.numberOfLines = 0 //기본 line수는 1
    }
    
    func setBoardTextField(){
        boardTextField.placeholder = "내용을 입력해주세요."
        boardTextField.textColor = .brown
        boardTextField.keyboardType = .emailAddress
        boardTextField.borderStyle = .line
    }
}


