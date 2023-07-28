//
//  Case3TableViewController.swift
//  TableView
//
//  Created by 임영준 on 2023/07/27.
//


import UIKit

class Case3TableViewController: UITableViewController{
    
    @IBOutlet var shoppingHeaderView: UIView!
    @IBOutlet var shoppingTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var shoppingList = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
    }
    
    @IBAction func addButtonDidTap(_ sender: UIButton) {
        guard let text = shoppingTextField.text else{
            return
        }
        if text.isEmpty {
            showAlert()
            return
        }
        shoppingList.append(text)
        tableView.reloadData()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "한 글자 이상 입력해주세요", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    func setProperties(){
        tableView.rowHeight = 60
        addButton.setTitle("추가", for: .normal)
        addButton.layer.cornerRadius = 10
        addButton.backgroundColor = .systemGray5
        addButton.setTitleColor(.black, for: .normal)
        
        shoppingTextField.placeholder = "무엇을 구매하실 건가요?"
        shoppingTextField.borderStyle = .none
        
        shoppingHeaderView.configureRoundedColorView()
    }
}

extension Case3TableViewController {
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as? ShoppingCell
        else {
            print("Wrong identifier")
            return UITableViewCell()
        }
        cell.titleLabel.text = shoppingList[indexPath.row]
        
        return cell
    }
}
