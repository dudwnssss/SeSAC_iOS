//
//  SignUpViewController.swift
//  Jackflix_CodeBase
//
//  Created by 임영준 on 2023/08/24.
//

import UIKit

class SignUpViewController: BaseViewController {

    let logo = UILabel().then{
        $0.text = "JACKFLIX"
        $0.textColor = .red
        $0.font = .systemFont(ofSize: 30, weight: UIFont.Weight(rawValue: 1))
    }
    let emailOrPhoneTextField = userInfoTextField().then{
        $0.placeholder = UserInfoType.emailOrPhone.rawValue
    }
    let passwordTextField = userInfoTextField().then{
        $0.placeholder = UserInfoType.password.rawValue
    }
    let nicknameTextField = userInfoTextField().then{
        $0.placeholder = UserInfoType.nickname.rawValue
    }
    let locationTextField = userInfoTextField().then{
        $0.placeholder = UserInfoType.location.rawValue
    }
    let recommendTextField = userInfoTextField().then{
        $0.placeholder = UserInfoType.recommend.rawValue
    }
    let singUpButton = UIButton().then{
        $0.titleLabel?.font = .boldSystemFont(ofSize: 16)
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 4
    }
    let moreInfoButton = UIButton().then{
        $0.setTitle("추가 정보 입력", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.setTitleColor(.white, for: .normal)
    }
    let jfSwitch = UISwitch().then{
        $0.isOn = true
        $0.onTintColor = .red
    }
    
    override func setProperties() {
        view.backgroundColor = .black
    }
    
    override func setLayouts() {
        view.addSubviews(logo, emailOrPhoneTextField, passwordTextField, nicknameTextField, locationTextField, recommendTextField, singUpButton, moreInfoButton, jfSwitch)
        
        logo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(32)
        }
        
        emailOrPhoneTextField.snp.makeConstraints {
            $0.top.equalTo(logo.snp.bottom).offset(120)
            $0.horizontalEdges.equalToSuperview().inset(36)
            $0.height.equalTo(32)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailOrPhoneTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(36)
            $0.height.equalTo(32)
        }
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(36)
            $0.height.equalTo(32)
        }
        locationTextField.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(36)
            $0.height.equalTo(32)
        }
        recommendTextField.snp.makeConstraints {
            $0.top.equalTo(locationTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(36)
            $0.height.equalTo(32)
        }
        singUpButton.snp.makeConstraints {
            $0.top.equalTo(recommendTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(36)
            $0.height.equalTo(44)
        }
        moreInfoButton.snp.makeConstraints {
            $0.leading.equalTo(singUpButton)
            $0.top.equalTo(singUpButton.snp.bottom).offset(16)
        }
        
        jfSwitch.snp.makeConstraints {
            $0.trailing.equalTo(singUpButton)
            $0.centerY.equalTo(moreInfoButton)
        }
    }
}
