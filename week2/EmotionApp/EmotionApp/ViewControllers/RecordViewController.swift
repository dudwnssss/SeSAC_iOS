//
//  ViewController.swift
//  EmotionApp
//
//  Created by 임영준 on 2023/07/25.
//

import UIKit

class RecordViewController: UIViewController {

    
    @IBOutlet var moodButtons: [UIButton]!
    let moods = Mood.allCases
    
    var scores = [0, 0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMoodButtonTags()
        setMoodButtonProperties()
        for item in moodButtons{
            setPullDownButton(button: item)
        }
    }
    
    func setMoodButtonTags(){
        for i in 0...moodButtons.count-1{
            moodButtons[i].tag = moods[i].rawValue
        }
    }
    
    func setPullDownButton(button: UIButton){
        let plus1 = UIAction(title: "+1", handler: {_ in
            self.scores[button.tag] += 1
            print("\(self.moods[button.tag]) 점수 \(self.scores[button.tag])점")
        })
        let plus5 = UIAction(title: "+5", handler: {_ in
            self.scores[button.tag] += 5
            print("\(self.moods[button.tag]) 점수 \(self.scores[button.tag])점")
        })
        let plus10 = UIAction(title: "+10", handler: {_ in
            self.scores[button.tag] += 10
            print("\(self.moods[button.tag]) 점수 \(self.scores[button.tag])점")
        })
        let reset = UIAction(title: "리셋", attributes: .destructive, handler: {_ in
            self.scores[button.tag] = 0
            print("\(self.moods[button.tag]) 점수 \(self.scores[button.tag])점")
        })
        
        let buttonMenu = UIMenu(children: [reset, plus10 , plus5, plus1])
        
        button.menu = buttonMenu
    }
    
    
    
    
    //의미상으로 ~버튼일때 ~하게 속성을 주고 싶다.
    func setMoodButtonProperties(){
        for item in moodButtons{
            switch Mood(rawValue: item.tag){
            case .happy:
                setButtonProperty(button: item, color: .systemPink, image: UIImage(named: "emoji1")!)
                break
            case .joy:
                setButtonProperty(button: item, color: .systemOrange, image: UIImage(named: "emoji2")!)
                break
            case .soso:
                setButtonProperty(button: item, color: .systemYellow, image: UIImage(named: "emoji3")!)
                break
            case .sad:
                setButtonProperty(button: item, color: .systemMint, image: UIImage(named: "emoji4")!)
                break
            case .depressed:
                setButtonProperty(button: item, color: .systemBlue, image: UIImage(named: "emoji5")!)
                break
            case .none:
                print("에러")
            }
        }
    }
    
    func setButtonProperty(button: UIButton, color: UIColor, image: UIImage){
        button.backgroundColor = color
        button.setImage(image, for: .normal)
    }
    
    @IBAction func moodButtonDidTap(_ sender: UIButton) {
        scores[sender.tag] += 1
        print("\(moods[sender.tag]) 점수 \(scores[sender.tag])점")
    }
}

