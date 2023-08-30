//
//  AddView.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit

class AddView: BaseView {
    
    let photoImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let searchButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        return button
    }()
    
    let searchProtocolButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        return button
    }()
    
    let dateButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle(DateFormatter.today(), for: .normal)
        return button
    }()
    
    let titleButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("오늘의 사진", for: .normal)
        return button
    }()
    
    let contentButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("컨텐츠", for: .normal)
        return button
    }()
    
    
    
    override func setProperties() {
        addSubview(photoImageView)
        addSubview(searchButton)
        addSubview(dateButton)
        addSubview(searchProtocolButton)
        addSubview(titleButton)
        addSubview(contentButton)
    }
    
    override func setLayouts() {
        photoImageView.snp.makeConstraints {
            $0.topMargin.leadingMargin.trailingMargin.equalTo(self.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(self).multipliedBy(0.3)
        }
        
        searchButton.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.bottom.trailing.equalTo(photoImageView)
        }
        
        dateButton.snp.makeConstraints {
            $0.top.equalTo(photoImageView.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(50)
        }
        
        searchProtocolButton.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.leading.bottom.equalTo(photoImageView)
        }
        
        titleButton.snp.makeConstraints {
            $0.top.equalTo(dateButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(50)
        }
        
        contentButton.snp.makeConstraints {
            $0.top.equalTo(titleButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(200)
        }
    }
}
