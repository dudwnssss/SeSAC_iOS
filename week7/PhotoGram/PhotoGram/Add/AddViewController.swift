//
//  ViewController.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/28.
//

import UIKit
import PhotosUI
import Kingfisher

//Protocol 값 전달 1.
protocol PassDataDelegate {
    func recieveDate(date: Date)
}

protocol PassImageDelegate{
    func recieveImageURL(imageURL: URL)
}

//Main, Detail
class AddViewController: BaseViewController {
    
    let addView = AddView()
    
    override func loadView() { //viewDidLoad보다 먼저 호출됨, super 메서드 호출 X
        self.view = addView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        APIService.shared.callRequest(query: "sky")
//        APIService.shared.callRequest()
//        ClassOpenExample.publicExample()
//        ClassPublicExample.publicExample()
//        ClassInternalExample.internalExample()
    }
    
    deinit {
        print("deinit", self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: .selecImage, object: nil)
//        sesacShowActivityViewController(image: UIImage(systemName: "star")!, url: "hello", text: "hi")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: .selecImage, object: nil)
    }
    
    @objc func selectImageNotificationObserver(notification: NSNotification){
        print(#fileID, #function, #line, "- ")
        
        if let name = notification.userInfo?["name"] as? String {
            addView.photoImageView.image = UIImage(systemName: name)
        }
    }
    
    @objc func titleButtonDidTap(){
        let vc = TitleViewController()
        
        //Closure - 3
        vc.completionHandler = { title, age, push in
            self.addView.titleButton.setTitle(title, for: .normal)
            print("completionHandler", age, title)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func contentButtonDidTap(){
        let vc = ContentViewController()
        vc.completionHandler = { text in
            self.addView.contentButton.setTitle(text, for: .normal)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentActionSheet(){
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let gallery = UIAlertAction(title: "갤러리에서 가져오기", style: .default) { _ in
            self.galleryButtonDidTap()
        }
        let web = UIAlertAction(title: "웹에서 검색하기", style: .default) { _ in
            let vc = SearchViewController()
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        [web, gallery, cancel].forEach{
            actionSheet.addAction($0)
        }
        present(actionSheet, animated: true)
    }
    
    @objc func dateButtonDidTap(){
        //Protocol 값 전달 5.
//        let vc = DateViewController()
//        vc.delegate = self
//        navigationController?.pushViewController(vc, animated: true)
        
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func searchProtocolButtonDidTap(){
        let vc = SearchViewController()
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc func searchButtonDidTap(){
        presentActionSheet()
    }
    
   func galleryButtonDidTap(){
        var configuration = PHPickerConfiguration()
        configuration.filter = .any(of: [.images])
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
    
    
    override func setProperties(){
        super.setProperties()
        print("Add setProperties")
        addView.searchButton.addTarget(self, action: #selector(searchButtonDidTap), for: .touchUpInside)
        addView.dateButton.addTarget(self, action: #selector(dateButtonDidTap), for: .touchUpInside)
        addView.searchProtocolButton.addTarget(self, action: #selector(searchProtocolButtonDidTap), for: .touchUpInside)
        addView.titleButton.addTarget(self, action: #selector(titleButtonDidTap), for: .touchUpInside)
        addView.contentButton.addTarget(self, action: #selector(contentButtonDidTap), for: .touchUpInside)
    }
    override func setLayouts(){
        super.setLayouts()
        print("Add setLayouts")

    }
    
}

extension AddViewController: PassDataDelegate {
    func recieveDate(date: Date) {
        let convertedDate = DateFormatter.convertDate(date: date)
        addView.dateButton.setTitle(convertedDate, for: .normal)
    }
}

extension AddViewController: PassImageDelegate {
    func recieveImageURL(imageURL: URL) {
        print("으아아", imageURL)
        addView.photoImageView.kf.setImage(with: imageURL)
    }
}

extension AddViewController: PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    self.addView.photoImageView.image = image as? UIImage
                }
            }
        } else {
            // TODO: Handle empty results or item provider not being able load UIImage
        }
    }
}
