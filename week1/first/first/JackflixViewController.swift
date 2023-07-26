//
//  ViewController.swift
//  SeSAC_iOS_Assignment3
//
//  Created by 임영준 on 2023/07/19.
//

import UIKit

enum TextFieldType: Int{
    case email = 100
    case password = 200
    case nickname = 300
    case location = 400
    case recommend = 500
}


class JackflixViewController: UIViewController {
    
    
    @IBOutlet var jackflixTextFields: [UITextField]!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var recommendTextField: UITextField!
    @IBOutlet var signupButton: UIButton!
    @IBOutlet var testSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //기본값 없음: nil
        let testString = UserDefaults.standard.string(forKey: "testString")
        
        //기본값 0
        let testInt = UserDefaults.standard.integer(forKey: "testInt")
        
        //기본값 false
        let testBool = UserDefaults.standard.bool(forKey: "testBool")
        
        print(testString,testInt, testBool)
        
        setTextFields()
        setSignupButton()
        setTestSwitch()
        setTextFieldTags()
        setTextFieldTexts()
        
        
    }

    func setTextFieldTexts(){
        
        let email = UserDefaults.standard.string(forKey: "email")
        let password = UserDefaults.standard.string(forKey: "password")
        let nickname = UserDefaults.standard.string(forKey: "nickname")
        let location = UserDefaults.standard.string(forKey: "location")
        let recommend = UserDefaults.standard.string(forKey: "recommend")
        
        if let email{
            emailTextField.text = email
        }
        if let password{
            passwordTextField.text = password
        }
        if let nickname {
            nicknameTextField.text = nickname
        }
        if let location {
            locationTextField.text = location
        }
        if let recommend {
            recommendTextField.text = recommend
        }
        
    }
    
    
    
    
    
    //회원가입 과제1
    func setTextFields(){
        for item in jackflixTextFields{
            item.layer.cornerRadius = 8
        }
        
        //        passwordTextField.isSecureTextEntry = true
        emailTextField.keyboardType = .emailAddress
    }
    
    func setTextFieldTags(){
        emailTextField.tag = TextFieldType.email.rawValue
        passwordTextField.tag = TextFieldType.password.rawValue
        nicknameTextField.tag = TextFieldType.nickname.rawValue
        locationTextField.tag = TextFieldType.location.rawValue
        recommendTextField.tag = TextFieldType.recommend.rawValue
    }
    
    //회원가입 과제2
    func setSignupButton(){
        signupButton.layer.cornerRadius = 8
        signupButton.setTitle("회원가입", for: .normal)
        signupButton.setTitleColor(.black, for: .normal)
        signupButton.backgroundColor = .white
    }
    
    //회원가입 과제3
    func setTestSwitch(){
        testSwitch.onTintColor = .systemRed
        testSwitch.thumbTintColor = .white
        testSwitch.setOn(true, animated: true)
    }
    
    //회원가입 과제4
    @IBAction func tapGestureDidTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func saveButtonDidTap(_ sender: UIButton) {
        
        UserDefaults.standard.set(emailTextField.text, forKey: "email")
        UserDefaults.standard.set(passwordTextField.text, forKey: "password")
        UserDefaults.standard.set(nicknameTextField.text, forKey: "nickname")
        UserDefaults.standard.set(locationTextField.text, forKey: "location")
        UserDefaults.standard.set(recommendTextField.text, forKey: "recommend")
        
        
        //저장 버튼 클릭 횟수 저장 기능
        //1. 저장된 횟수 가지고 오기
        let value = UserDefaults.standard.integer(forKey: "count")
        //2. 저장된 횟수에 1을 더하기
        let result = value + 1
        
        //3. 2번에서 나온 결과를 다시 저장해주기
        UserDefaults.standard.set(result, forKey: "count")
        
        //4. 확인
        print(UserDefaults.standard.integer(forKey: "count"))
    }
    
    
    
    
    @IBAction func keyboardReturnDidTap(_ sender: UITextField) {
        
        //두가지 한번에 처리
        guard let text = sender.text,
              let value = TextFieldType(rawValue: sender.tag) else{
            print("오류가 발생했습니다.")
            //나중에는 alert같은 사용자에게 noti를 주는 게 좋음
            return
        }
        
        //        switch sender.tag {
        //        case TextFieldType.email.rawValue:
        //            print("이메일은 \(text)입니다")
        //        case TextFieldType.password.rawValue:
        //            print("비밀번호는 \(text)입니다")
        //        case TextFieldType.nickname.rawValue:
        //            print("닉네임은 \(text)입니다")
        //        case TextFieldType.location.rawValue:
        //            print("위치는 \(text)입니다")
        //        case TextFieldType.recommend.rawValue:
        //            print("추천코드는 \(text)입니다")
        //        default:
        //            print("오류가 발생했습니다.")
        //        }
        
        //중요중요 중요중요
//        guard let value = TextFieldType(rawValue: sender.tag) else {
//            print("오류가 발생했습니다.")
//            return
//        }
        
        switch value {
        case .email:
            print("이메일은 \(text)입니다")
        case .password:
            print("비밀번호는 \(text)입니다")
        case .nickname:
            print("닉네임은 \(text)입니다")
        case .location:
            print("위치는 \(text)입니다")
        case .recommend:
            print("추천코드는 \(text)입니다")
        }
        
        
        
        func signupButtonDidTap(_ sender: Any){
            //회원가입 과제5
            view.endEditing(true)
            
            
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            
            let button1 = UIAlertAction(title: "11111", style: .destructive)
            let cancel = UIAlertAction(title: "22222", style: .cancel)
            //액션 시트에서 맨 밑에 나타날 것임
            //cancel이 두개면 어떻게 될까? -> 강제 종료됨
            
            let cancel2 = UIAlertAction(title: "44444", style: .cancel)
            //handler버튼을 클릭했을 때 뭐 할건지
            //스토리보드에 바로 나타나지 않으니까 나중에 떴을 때, ibacton처럼 쓸 수 있는 공간을 미리 제공
            
            let confirm = UIAlertAction(title: "33333", style: .default)
            
            alert.addAction(button1)
            alert.addAction(cancel)
            alert.addAction(confirm)
            
            //cancel은 어디 넣든 맨 밑에 붙음
            
            present(alert, animated: true)
            //uiviewcontroller자리에 alert controller가 들어갈 수 있는 이유는 alert도 뷰컨에서 왔기 때문
            //animated는 대부분 true를 쓴다.
        }
        
    }
    
}
