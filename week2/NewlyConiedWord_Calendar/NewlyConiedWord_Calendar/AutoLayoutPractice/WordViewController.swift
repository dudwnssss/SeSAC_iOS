//
//  WordViewController.swift
//  NewlyConiedWord_Calendar
//
//  Created by 임영준 on 2023/07/21.
//

import UIKit

class WordViewController: UIViewController {

    @IBOutlet var wordFirstButton: UIButton!
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wordTextField.text = getRandomWord()
        wordFirstButton.titleLabel?.font = .systemFont(ofSize: 20)
        wordFirstButton.titleLabel?.textColor = .black
        //?는 nil인지 아닌지를 판단해줌
        //titleLabel이 nil이면 이후 코드는 실행되지 않는다
    }
    
    @discardableResult
    func getRandomWord() -> String{
        let random = ["고래밥", "칙촉", "카스타드", "메로나", "월드콘"]
        let result = random.randomElement()!
        return result
    }


    @IBAction func wordTextFieldDidTap(_ sender: UITextField) {
        print(#fileID, #function, #line, "- ")
        
//        if wordTextField.text == "별다줄" {
//            resultLabel.text = "별다줄 뜻은 별거 다 줄인다입니다"
//        }
//        else if wordTextField.text == "뉴진스" {
//            resultLabel.text = "뉴진스 뜻은 newjeans.."
//        }
//        else {
//            resultLabel.text = "찾는 결과가 없습니다."
//        }
        
    
        
        switch wordTextField.text {
        case "별다줄":
            resultLabel.text = "별다줄 뜻은 별거 다 줄인다입니다"
            break
        case "뉴진스":
            resultLabel.text = "뉴진스 뜻은.."
            break
        case "알잘딱깔센":
            resultLabel.text = "알아서 잘.."
            break
            
        case "jmt", "JMT", "Jmt":
            resultLabel.text = "존맛탱"
            break
            
        default :
            resultLabel.text = "찾는 결과가 없습니다.."
            break
    
        }
            
    }
    
    //버튼 클릭 시 텍스트필드의 텍스트에 버튼 타이틀이 들어가는 기능
    @IBAction func wordButtonDidTap(_ sender: UIButton) {
        print(sender.currentTitle)
        wordTextField.text = sender.currentTitle
        wordTextFieldDidTap(wordTextField)
    }
    
    
    
}
