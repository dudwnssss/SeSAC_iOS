//
//  ProfileViewController.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/29.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    let profileView = ProfileView()
    
    var subTitles = EditCase.subTitles{
        didSet{
            profileView.tableView.reloadData()
        }
    }
    
    override func loadView() {
        self.view = profileView
    }
    let editCase = EditCase.allCases
    
    override func setProperties() {
        title = "프로필편집"
        profileView.tableView.delegate = self
        profileView.tableView.dataSource = self
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
            navigationController?.pushViewController(vc, animated: true)
        case .gender:
            let vc = GenderClosureViewController()
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
        
    }
}
