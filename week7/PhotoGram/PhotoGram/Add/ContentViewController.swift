//
//  ContentViewController.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/29.
//


import UIKit

class ContentViewController: BaseViewController{
    let textView = {
        let view = UITextView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let animationView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let animation2View = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    //Closure - 1
    var completionHandler: ((String) -> ())?
    
    
    override func setProperties() {
        setAnimation()
    }
    override func setLayouts() {
        view.addSubview(textView)
        view.addSubview(animationView)
        view.addSubview(animation2View)
        
        animationView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.center.equalTo(view)
        }
        
        animation2View.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.center.equalTo(view).offset(80)
        }
        
        textView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(250)
        }
    }
    
    deinit {
        print("deinit", self)
    }
    
    func setAnimation(){
        //시작
        animationView.alpha = 0
        animation2View.alpha = 0
        //끝
        UIView.animate(withDuration: 1, delay: 2, options: [.curveLinear]) {
            self.animationView.alpha = 1
            self.animationView.backgroundColor = .blue
        } completion: { bool in
            UIView.animate(withDuration: 1) {
                self.animation2View.alpha = 1
            }
        }

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        //Closuer - 2
        completionHandler?(textView.text!)
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.animation2View.alpha = 1.0
            
            UIView.animate(withDuration: 0.3) {
                self.animation2View.alpha = 0.5
            }
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.animation2View.alpha = 0.5
            UIView.animate(withDuration: 0.3) {
                self.animation2View.alpha = 1.0
            }
        }
    }
}
