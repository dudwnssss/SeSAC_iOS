//
//  Case2TableViewController.swift
//  TableView
//
//  Created by 임영준 on 2023/07/27.
//

import UIKit

class Case2TableViewController: UITableViewController{
    
    enum SettingType: Int, CaseIterable {
        case total
        case personal
        case etc
    }
    
    let settings = SettingType.allCases
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
        if let setting = SettingType(rawValue: section){
            switch setting {
            case .total:
                return totalSettingList.count
            case .personal:
                return personalSettingList.count
            case .etc:
                return etcSettingList.count
            }
        }
        
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let setting = SettingType(rawValue: section){
            switch setting {
            case .total:
                return "전체설정"
            case .personal:
                return "개인설정"
            case .etc:
                return "기타"
            }
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") else {
            print("Wrong identifier")
            return UITableViewCell()
        }
        cell.textLabel?.font = .systemFont(ofSize: 14)
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .black

        if let setting = SettingType(rawValue: indexPath.section){
            switch setting {
            case .total:
                cell.textLabel?.text = totalSettingList[indexPath.row]
            case .personal:
                cell.textLabel?.text = personalSettingList[indexPath.row]
            case .etc:
                cell.textLabel?.text = etcSettingList[indexPath.row]
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print(#fileID, #function, #line, "- ")
        return 44
    }
}
