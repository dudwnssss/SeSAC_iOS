//
//  NCCViewController.swift
//  NewlyConiedWord_Calendar
//
//  Created by 임영준 on 2023/07/20.
//

import UIKit

class NCCViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var newWordButtons: [UIButton]!
    @IBOutlet var newWordTextField: UITextField!
    @IBOutlet var newWordSearchButton: UIButton!
    @IBOutlet var meaningLabel: UILabel!
    
    var newWords = ["점메추" : "점심 메뉴 추천", "웃안웃": "웃긴데 안웃겨", "캘박" : "캘린더 박제", "농협은행": "너무 예쁘네요", "이생망": "이번 생은 망했어", "JMT": "존맛탱"]
    
    var temp : String?
    
    var temp2 : String? = "temp"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newWordTextField.delegate = self
        setMeaningLabel()
        setButton()
        setNewWordButtonProperties()
        setNewWordButtonTexts()
        
        if let temp {
            print(temp)
        }
        if let temp2 {
            print(temp2)
        }
    }
    
    func shuffleNewWords(words: [String : String])->[String]{
        var shuffledWords = words.keys.shuffled()
        let splitedShuffledWords = Array(shuffledWords.prefix(newWordButtons.count))
        return splitedShuffledWords
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        if let words = newWordTextField.text{
            if words.count > 1{
                search()
                setNewWordButtonTexts()
            }
            else{
                presentAlert()
            }
        }
        return true
    }
    
    @IBAction func tapGestureDidTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    func setButton(){
        newWordSearchButton.backgroundColor = .black
        newWordSearchButton.setTitle("", for: .normal)
        newWordSearchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        newWordSearchButton.tintColor = .white
    }
    
    func presentAlert(){
        let alert = UIAlertController(title: "글자 수 제한", message: "단어를 2글자 이상 입력해주세요", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
    
    func setNewWordButtonProperties(){
        for i in 0...newWordButtons.count-1{
            newWordButtons[i].layer.cornerRadius = 8
            newWordButtons[i].layer.borderWidth = 1
            newWordButtons[i].layer.borderColor = UIColor.black.cgColor
            newWordButtons[i].setTitleColor(.black, for: .normal)
        }
    }
    
    func setNewWordButtonTexts(){
        let words = shuffleNewWords(words: newWords)
        for i in 0...newWordButtons.count-1{
            newWordButtons[i].setTitle(words[i], for: .normal)
        }
    }
    
    
    @IBAction func newWordButtonDidTap(_ sender: UIButton) {
        newWordTextField.text = sender.currentTitle
    }
    
    func setNewTextField(){
        newWordTextField.placeholder = "검색어를 입력해주세요"
        newWordTextField.layer.borderColor = UIColor.black.cgColor
        newWordTextField.layer.borderWidth = 2
    }
    
    
    func setMeaningLabel(){
        meaningLabel.text = "검색결과가 표시됩니다"
        meaningLabel.textAlignment = .center
        meaningLabel.layer.borderColor = UIColor.black.cgColor
        meaningLabel.layer.borderWidth = 2
    }
    
    func search(){
        meaningLabel.text = newWords[newWordTextField.text ?? ""] ?? "해당 검색어의 결과가 없습니다."
    }
    
    @IBAction func searchButtonDidTap(_ sender: Any){
        if let words = newWordTextField.text{
//            if words.count > 1{
//                search()
//                setNewWordButtonTexts()
//            }
//            else{
//                presentAlert()
//            }
        }
    }
}
