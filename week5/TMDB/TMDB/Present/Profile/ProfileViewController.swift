//
//  ProfileViewController.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/29.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    let profileView = ProfileView()
    let editCase = EditCase.allCases
    
    var subTitles = EditCase.subTitles{
        didSet{
            profileView.tableView.reloadData()
        }
    }
    
    override func loadView() {
        self.view = profileView
    }
    
    override func setProperties() {
        NotificationCenter.default.addObserver(self, selector: #selector(captureNameNotification(notification:)), name: NSNotification.Name("Name"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(captureUsernameNotification(notification:)), name: NSNotification.Name("Username"), object: nil)
        title = "프로필편집"
        profileView.tableView.delegate = self
        profileView.tableView.dataSource = self
    }
    
    
    @objc func captureNameNotification(notification: NSNotification){
        if let name = notification.userInfo?["name"] as? String {
            subTitles[0] = name
        }
    }
    
    @objc func captureUsernameNotification(notification: NSNotification){
        if let username = notification.userInfo?["username"] as? String {
            subTitles[1] = username
        }
    }
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editCase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#fileID, #function, #line, "- ")
        switch editCase[indexPath.row]{
        case .name, .username, .genderAlias, .introduction:
            tableView.separatorInset = UIEdgeInsets(top: 0, left: 120, bottom: 0, right: 0)
        case .link, .gender:
            tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as? ProfileCell else {return UITableViewCell()}
        cell.titleLabel.text = editCase[indexPath.row].rawValue
        cell.subLabel.text = subTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch editCase[indexPath.row]{
            //vc연습용
        case .name:
            let vc = NameNotificationViewController()
            navigationController?.pushViewController(vc, animated: true)
        case .username:
            let vc = UsernameNotificationViewController()
            navigationController?.pushViewController(vc, animated: true)
        case .genderAlias:
            let vc = GenderAliasDelegateViewController()
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        case .introduction:
            let vc = DescriptionDelegateViewController()
            vc.delegate = self
            navigationController?.pushViewController(vc, animated: true)
        case .link:
            let vc = LinkClosureViewController()
            vc.completionHandler = { text in
                print(text)
                self.subTitles[4] = text
            }
            navigationController?.pushViewController(vc, animated: true)
        case .gender:
            let vc = GenderClosureViewController()
            vc.completionHandler = {text in
                print(text)
                self.subTitles[5] = text
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ProfileViewController: GenderAliasDelegate{
    func passGenderAlias(genderAlias: String) {
        subTitles[2] = genderAlias
    }
}

extension ProfileViewController: DescriptionDelegate{
    func passDescriptionDelegate(description: String) {
        subTitles[3] = description
    }
}
