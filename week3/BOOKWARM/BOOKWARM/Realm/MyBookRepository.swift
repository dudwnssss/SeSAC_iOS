//
//  MyBookRepository.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/09/06.
//

import Foundation
import RealmSwift

protocol MyBookRepositoryType: AnyObject {
    func fetch() -> Results<MyBookInfo>
    func fetchFilter() -> Results<MyBookInfo>
    func create(_ item: MyBookInfo)
    func delete(_ item: MyBookInfo)
    func update(item: MyBookInfo, key: String, value: String)
}

class MyBookRepository: MyBookRepositoryType{
    
    private let realm = try! Realm()
    
    func fetch() -> RealmSwift.Results<MyBookInfo> {
        let data = realm.objects(MyBookInfo.self).sorted(byKeyPath: "title", ascending: false)
        return data
    }
    
    func fetchFilter() -> RealmSwift.Results<MyBookInfo> {
        let data = realm.objects(MyBookInfo.self).sorted(byKeyPath: "date", ascending: true)
        return data
    }
    
    func create(_ item: MyBookInfo) {
        do {
            try! realm.write{
            realm.add(item)
            }
        }
    }
    
    func delete(_ item: MyBookInfo){
        do {
            try realm.write{
                realm.delete(item)
            }
        } catch {
            print(error)
        }
    }
    
    func update(item: MyBookInfo, key: String, value: String){
        do {
            try realm.write{
                item.setValue(value, forKey: key)
            }
        } catch {
            print(error) //ns로그 등으로 기록을 남기기
        }
    }
    
}
