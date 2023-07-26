//
//  MovieViewController.swift
//  first
//
//  Created by 임영준 on 2023/07/19.
//

import UIKit

class MovieViewController: UIViewController {
    
    
    @IBOutlet var previewImageVIews: [UIImageView]!
    
    
    @IBOutlet var previewFirstImageView: UIImageView!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var randomPlayButton: UIButton!
    @IBOutlet var logoLabel: UILabel!
    @IBOutlet var previewSecondImageView: UIImageView!
    
    //사용자에게 화면이 보이기 직전에 실행되는 부분
    //모서리, 둥글기, 그림자 등 스토리보드에서 설정할 수 없는 UI를 설정할 때 주로 사용
    //뷰컨트롤러 생명주기
    
    let movie = ["극한직업", "도둑들", "명량", "부산행"]
    let colors = [UIColor.systemMint, UIColor.systemPurple, UIColor.systemPink]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let random : Int = .random(in: 1...5)
        //        let random = [1, 2, 3, 4, 5]
        //왜 상수를 써도 문제가 안생길까?
        //viewDidload에서 실행되는 동안에는 달라지지 않음
        //        let random = Int.random(in: 1...5)
        //        previewFirstImageView.image = UIImage(named: "\(random)")
        
        //        let randomResult = random.randomElement()!
        //        previewFirstImageView.image = UIImage(named: "\(randomResult)")
        
        setButton()
        setImageViews()
        
        
    }
    
    func setImageViews(){
        for item in previewImageVIews{
            setPreviewImageView(item, borderColor: colors.randomElement()!.cgColor)
        }
        
    }
    
    
    @IBAction func likeButtonClicked(_ sender: UIButton) {
        
        //1. 제목이나 내용을 띄워줘
        let alert = UIAlertController(title: "이곳이 타이틀입니다", message: "이러쿵 저러쿵 내요을 작성해주세요!", preferredStyle: .alert)
        //2. 취소와 확인버튼 만들기
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default)
        //3. 1번과 2번 붙이기
        alert.addAction(cancel)
        alert.addAction(ok)
        //4. 띄워주세여
        present(alert, animated: true)
    }
    
    
    @IBAction func playButtonClicked(_ sender: UIButton) {
        for item in previewImageVIews{
            showRandomMovie(name: item)
        }
        showRandomMovie(name: posterImageView)
    }
    
    
    @IBAction func randomButtonClicked(_ sender: UIButton) {
        let randomValue = Int.random(in: 0...movie.count - 1)
        let randomMovie = movie[randomValue]
        previewSecondImageView.image = UIImage(named: randomMovie)
        
    }
    
    func showRandomMovie(name: UIImageView) {
        var random = [1, 2, 3, 4, 5]
        let randomResult = random.randomElement()!
        name.image = UIImage(named: "\(randomResult)")
    }
    
    func setProperties(){
        
    }
     
    
    //outletName: 외부 매개변수(Argument Label), name: 내부 매개변수
    //매개변수: Parameter
    //전달인자: Argument - 함수를 호출할 때 전달하는 값(시시각각 변동)
    func setPreviewImageView(_ name: UIImageView, borderColor: CGColor){ //함수 안과 밖에서 사용되는 이름이 달라짐
        name.layer.cornerRadius = 30
        name.layer.borderColor = borderColor //타입이 달라서 생략 불가
        name.layer.borderWidth = 5
        name.backgroundColor = .blue //100% 타입을 알고 있을 때 가능
        name.contentMode = .scaleAspectFill
    }
    
    func setButton(){
        randomPlayButton.setTitle("재생", for: .normal)
        randomPlayButton.setTitle("눌러주세요", for: .highlighted)
        randomPlayButton.setTitleColor(.white, for: .normal)
        randomPlayButton.setTitleColor(.red, for: .highlighted)
        
        
        let normal = UIImage(named: "play_normal")
        let highlight = UIImage(named: "play_highlighted")
        
        randomPlayButton.setImage(normal, for: .normal)
        randomPlayButton.setImage(highlight, for: .highlighted)
        
        
        randomPlayButton.layer.cornerRadius = 10
        randomPlayButton.layer.borderColor = UIColor.red.cgColor
        randomPlayButton.layer.borderWidth = 4
    }
    
}
