//
//  DetailViewController.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/07/31.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    @IBOutlet var dismissButton: UIButton!
    @IBOutlet var infoBackgroundView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImageVIew: UIImageView!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var overviewLabel: UILabel!
    @IBOutlet var memoTextView: UITextView!
    
//    var movie: Movie?
    var myBookInfo: MyBookInfo?
    
    var isNav: Bool = false
    let placeholder = "메모를 입력해주세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
        setNavigationBar()
        setDismissButton()
        memoTextView.delegate = self
        hideKeyboardWhenTappedAround()
    }
    
    func setDismissButton(){
        dismissButton.isHidden = isNav ? true : false
    }
    
    @IBAction func dismissButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    func setProperties(){
        guard let myBookInfo else {
             return
        }
        titleLabel.text = myBookInfo.title
        titleLabel.font = .boldSystemFont(ofSize: 17)
        titleLabel.textColor = .white
        let url = URL(string: myBookInfo.thumb)
        posterImageVIew.kf.setImage(with: url)
        overviewLabel.text = myBookInfo.overView
        overviewLabel.numberOfLines = 0
        overviewLabel.font = .systemFont(ofSize: 14)
        rateLabel.text = myBookInfo.author
        rateLabel.font = .systemFont(ofSize: 12)
        rateLabel.textColor = .darkGray
        memoTextView.text = placeholder
        memoTextView.textColor = .lightGray
        setInfoBackgroundView()
        dismissButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        dismissButton.setTitle("", for: .normal)
        dismissButton.tintColor = .white
    }
    
    func setInfoBackgroundView(){
        infoBackgroundView.layer.cornerRadius = 8
        infoBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    
    func setNavigationBar(){
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.topItem?.title = ""
    }


}

extension DetailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if memoTextView.textColor == .lightGray {
            memoTextView.text = ""
            memoTextView.textColor = .black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if memoTextView.text.isEmpty {
            memoTextView.text = placeholder
            memoTextView.textColor = .lightGray
        }
    }
}
