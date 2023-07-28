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
    
    var shoppingInfo = ShoppingInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        setProperties()
    }
    
    @IBAction func addButtonDidTap(_ sender: UIButton) {
        guard let text = shoppingTextField.text else{
            return
        }
        if text.isEmpty { //빈문자열인지 체크
            showAlert()
            return
        }
        shoppingInfo.shoppingList.append(ShoppingItem(check: false, title: text, like: false))
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
        return shoppingInfo.shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingCell.identifier) as? ShoppingCell
        else {
            print("Wrong identifier")
            return UITableViewCell()
        }
        
        let row = shoppingInfo.shoppingList[indexPath.row]
        cell.configureCell(row: row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        shoppingInfo.shoppingList[indexPath.row].check.toggle()
        tableView.reloadData()
    }
}
