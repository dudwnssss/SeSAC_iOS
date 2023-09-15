//
//  ViewController.swift
//  Setting
//
//  Created by 임영준 on 2023/09/15.
//

import UIKit

class SettingViewController: BaseViewController {
    
    let settingView = SettingView()
    let settingViewModel = SettingViewModel()

    var dataSource: UICollectionViewDiffableDataSource<SettingType, Setting>!
    
    override func loadView() {
        self.view = settingView
    }
    
    override func setProperties() {
        configureDataSource()
        setSnapshot()
    }
 
}

extension SettingViewController {
    
    private func setSnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<SettingType, Setting>()
        snapshot.appendSections(SettingType.allCases)
        snapshot.appendItems(settingViewModel.totalSettingList, toSection: .total)
        snapshot.appendItems(settingViewModel.personalSettingList, toSection: .personal)
        snapshot.appendItems(settingViewModel.etcSettingList, toSection: .etc)
        dataSource.apply(snapshot)
    }
    
    private func configureDataSource(){
        //collectionView.register
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Setting> { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.itemTitle
            content.textProperties.color = .white
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .black
            cell.backgroundConfiguration = backgroundConfig
        }
        
        //cellForItemAt
        dataSource = UICollectionViewDiffableDataSource(collectionView: settingView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
}
