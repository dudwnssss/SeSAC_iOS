//
//  StatisticsViewController.swift
//  EmotionApp
//
//  Created by 임영준 on 2023/07/25.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet var backgroundViews: [UIView]!
    @IBOutlet var titleLabels: [UILabel]!
    @IBOutlet var scoreLabels: [UILabel]!
    let moods = Mood.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
        setTags()
        setMoodProperties()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setScoreTexts()
    }
    
    func setScoreTexts(){
        for i in 0...moods.count-1{
            if let mood = Mood(rawValue: i){
                scoreLabels[i].text = "\(UserDefaults.standard.integer(forKey: "\(mood)"))점"}
        }
    }
    
    func setProperties(){
        for i in 0...moods.count-1{
            backgroundViews[i].layer.cornerRadius = 10
            scoreLabels[i].font = scoreLabels[i].font.withSize(30)
                scoreLabels[i].text = "0점"}
    }
    
    func setTags(){
        for i in 0...moods.count-1{
            backgroundViews[i].tag = moods[i].rawValue
            titleLabels[i].tag = moods[i].rawValue
            scoreLabels[i].tag = moods[i].rawValue
        }
    }
    
    func setMoodProperties(){
        for i in 0...moods.count-1{
            switch Mood(rawValue: i){
            case .happy:
                backgroundViews[i].backgroundColor = .systemPink
                titleLabels[i].text = "완전행복지수"
                titleLabels[i].textColor = .white
                scoreLabels[i].textColor = .white
            case .joy:
                backgroundViews[i].backgroundColor = .systemOrange
                titleLabels[i].text = "적당미소지수"

            case .soso:
                backgroundViews[i].backgroundColor = .systemYellow
                titleLabels[i].text = "그냥그냥지수"

            case .sad:
                backgroundViews[i].backgroundColor = .systemMint
                titleLabels[i].text = "좀속상한지수"

            case .depressed:
                backgroundViews[i].backgroundColor = .systemBlue
                titleLabels[i].text = "많이슬픈지수"
                titleLabels[i].textColor = .white
                scoreLabels[i].textColor = .white

            default:
                print("에러")
                break
            }
        }
    }
    
    
}
