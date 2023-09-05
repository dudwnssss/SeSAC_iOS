//
//  UIVIewController+.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/08/03.
//

import UIKit.UIViewController

extension UIViewController{
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(hideKeyboard)
        )
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController{
        
        func removeImageFromDocument(fileName: String){
            guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            do {
                try FileManager.default.removeItem(at: fileURL)
            } catch {
                print(error)
            }
        }
        
        func loadImageFromDocument(fileName: String) -> UIImage{
            guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return UIImage(systemName: "star.fill")!}
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            if FileManager.default.fileExists(atPath: fileURL.path){
                return UIImage(contentsOfFile: fileURL.path)!
            } else {
                return UIImage(systemName: "star.fill")!
            }
        }
        
        //도큐먼트 폴더에 이미지 저장
        func saveImageToDocument(fileName: String, image: UIImage){
            guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            guard let data = image.jpegData(compressionQuality: 0.5) else {return}
            do {
                try data.write(to: fileURL)
            } catch let error {
                print("file save error", error)
            }
        
    }
}
