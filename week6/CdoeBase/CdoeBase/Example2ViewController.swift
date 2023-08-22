//
//  Example2ViewController.swift
//  CdoeBase
//
//  Created by 임영준 on 2023/08/22.
//

import UIKit

class Example2ViewController: UIViewController {

    let backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "background")
        view.backgroundColor = .systemMint
        return view
    }()
    let backgroundDarkView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        return view
    }()
    let dismisButton: UIButton = {
        let view = UIButton()
        view.setKaKaoTopButton(imageString: "xmark")
        return view
    }()
    let presentButton: UIButton = {
        let view = UIButton()
        view.setKaKaoTopButton(imageString: "heart.circle")
        return view
    }()
    let diceButton: UIButton = {
        let view = UIButton()
        view.setKaKaoTopButton(imageString: "viewfinder.circle")
        return view
    }()
    let settingButton: UIButton = {
        let view = UIButton()
        view.setKaKaoTopButton(imageString: "gearshape.circle")
        return view
    }()
    let profileImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemPink
        view.image = UIImage(named: "minian")
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 40
        view.clipsToBounds = true
        return view
    }()
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    let nameLabel: UILabel = {
        let view = UILabel()
        view.text = "JACK"
        view.font = .boldSystemFont(ofSize: 16)
        view.textColor = .white
        return view
    }()
    let selfChatButton: UIButton = {
        let view = UIButton()
        view.setKaKaoBottomButton(imageString: "message.fill", title: "나와의 채팅")
        return view
    }()
    let profileEditButton: UIButton = {
        let view = UIButton()
        view.setKaKaoBottomButton(imageString: "pencil", title: "프로필 편집")
        return view
    }()
    let storyButton: UIButton = {
        let view = UIButton()
        view.setKaKaoBottomButton(imageString: "quote.closing", title: "카카오스토리")
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayouts()
    }
    
    func setLayouts(){
        view.addSubviews(backgroundImageView, backgroundDarkView, dismisButton, presentButton, diceButton, settingButton, profileImageView, separatorView, nameLabel, selfChatButton, profileEditButton, storyButton)
        
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        backgroundDarkView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-100)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        
        profileEditButton.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom)
            $0.centerX.equalTo(separatorView)
            $0.size.equalTo(100)
        }
        
        selfChatButton.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom)
            $0.trailing.equalTo(profileEditButton.snp.leading).offset(-10)
            $0.size.equalTo(100)
        }
        
        storyButton.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom)
            $0.leading.equalTo(profileEditButton.snp.trailing).offset(10)
            $0.size.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints {
            $0.bottom.equalTo(separatorView.snp.top).offset(-30)
            $0.centerX.equalTo(separatorView)
        }
        
        profileImageView.snp.makeConstraints {
            $0.bottom.equalTo(nameLabel.snp.top).offset(-8)
            $0.size.equalTo(100)
            $0.centerX.equalTo(separatorView)
        }
        
        dismisButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.size.equalTo(40)
        }
        
        settingButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.size.equalTo(40)
        }
        
        diceButton.snp.makeConstraints {
            $0.trailing.equalTo(settingButton.snp.leading)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.size.equalTo(40)
        }
        
        presentButton.snp.makeConstraints {
            $0.trailing.equalTo(diceButton.snp.leading)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.size.equalTo(40)
        }
    }
}
