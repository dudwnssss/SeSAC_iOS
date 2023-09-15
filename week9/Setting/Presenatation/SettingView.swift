//
//  SettingView.swift
//  Setting
//
//  Created by 임영준 on 2023/09/15.
//

import UIKit

class SettingView: BaseView{
    
    let settingViewModel = SettingViewModel()
    let settingList = SettingType.allCases
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<SettingType, Setting>!
    
    private func createLayout() -> UICollectionViewLayout{
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.showsSeparators = true
        configuration.backgroundColor = .black
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
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
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    override func setProperties() {
        configureDataSource()
        setSnapshot()
    }
    
    //numbersOfItemsInSection
    func setSnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<SettingType, Setting>()
        snapshot.appendSections(SettingType.allCases)
        snapshot.appendItems(settingViewModel.totalSettingList, toSection: .total)
        snapshot.appendItems(settingViewModel.personalSettingList, toSection: .personal)
        snapshot.appendItems(settingViewModel.etcSettingList, toSection: .etc)
        dataSource.apply(snapshot)
    }
    
    override func setLayouts() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}

