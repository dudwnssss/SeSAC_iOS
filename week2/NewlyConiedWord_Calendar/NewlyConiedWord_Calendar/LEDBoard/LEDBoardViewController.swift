//
//  LEDBoardViewController.swift
//  NewlyConiedWord_Calendar
//
//  Created by 임영준 on 2023/07/24.
//

import UIKit

class LEDBoardViewController: UIViewController {

    @IBOutlet var textFieldBackGroundView: UIView!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var labelColorButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    let labelColors : [UIColor] = [.systemBlue, .systemMint, .systemRed, .systemPink, .systemPurple, .systemGreen]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
    }
    
    func setProperties(){
        self.view.backgroundColor = .black
        textFieldBackGroundView.layer.cornerRadius = 8
        setButtons()
        setInputTextField()
        setResultLabel()
        labelColorButtonDidTap(labelColorButton)
    }
    
    func setButtons(){
        for item in buttons{
            item.layer.cornerRadius = 8
            item.layer.borderColor = UIColor.black.cgColor
            item.layer.borderWidth = 1.5
            
        }
        sendButton.setTitle("보내기", for: .normal)
        sendButton.setTitleColor(.black, for: .normal)
        labelColorButton.setTitle("Aa", for: .normal)
        
    }
    
    func setInputTextField(){
        inputTextField.placeholder = "텍스트를 입력하세요"
        inputTextField.tintColor = .red
        inputTextField.borderStyle = .none
    }
    
    func setResultLabel(){
        resultLabel.font = resultLabel.font.withSize(100)
        resultLabel.textAlignment = .center
        //반환값 사용하기
        resultLabel.lineBreakMode = .byTruncatingMiddle
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
        textFieldBackGroundView.isHidden.toggle()
    }
    
    @IBAction func sendButtonDidTap(_ sender: UIButton) {
        
        resultLabel.text = inputTextField.text
    }
    
    @IBAction func labelColorButtonDidTap(_ sender: UIButton) {
        sender.tintColor = labelColors.randomElement()
        resultLabel.textColor = sender.tintColor
        inputTextField.tintColor = sender.tintColor
    }
    
    
}
