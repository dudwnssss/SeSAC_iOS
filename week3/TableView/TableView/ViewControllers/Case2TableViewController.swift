//
//  Case2TableViewController.swift
//  TableView
//
//  Created by 임영준 on 2023/07/27.
//

import UIKit

class Case2TableViewController: UITableViewController{
    
    enum SettingType: CaseIterable {
        case total, personal, etc
    }
    
    let settings = SettingType.allCases
//    let setting : SettingType
    
    let totalSettingList = ["공지사항", "실험실", "버전 정보"]
    let personalSettingList = ["개인/보안", "알림", "채팅", "프로필"]
    let etcSettingList = ["고객센터/도움말"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        if section == 0 {
            return totalSettingList.count
        }
        else if section == 1{
            return personalSettingList.count
        }
        else{
            return etcSettingList.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "전체 설정"
        }
        else if section == 1{
            return "개인 설정"
        }
        else {
            return "기타"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") else {
            print("Wrong identifier")
            return UITableViewCell()
        }
        cell.textLabel?.font = .systemFont(ofSize: 14)
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .black

        if indexPath.section == 0 {
            cell.textLabel?.text = totalSettingList[indexPath.row]
        }
        else if indexPath.section == 1{
            cell.textLabel?.text = personalSettingList[indexPath.row]
        }
        else{
            cell.textLabel?.text = etcSettingList[indexPath.row]
        }
        
        
        
        return cell
    }
}
