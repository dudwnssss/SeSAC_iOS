//
//  Case2TableViewController.swift
//  TableView
//
//  Created by 임영준 on 2023/07/27.
//

import UIKit

class Case2TableViewController: UITableViewController{
    
    let settings = SettingType.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 44
        setProperties()
    }
    
    func setProperties(){
        view.backgroundColor = .black
    }
}

extension Case2TableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].settingDetail.count
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settings[section].settingTitle
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") else {
            print("Wrong identifier")
            return UITableViewCell()
        }
        cell.textLabel?.font = .systemFont(ofSize: 14)
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .black
        cell.textLabel?.text = settings[indexPath.section].settingDetail[indexPath.row]
        return cell
    }
    
}
