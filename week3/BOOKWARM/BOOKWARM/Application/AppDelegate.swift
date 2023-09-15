//
//  AppDelegate.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/07/31.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let config = Realm.Configuration(schemaVersion: 7){ migration,oldSchemaVersion in
            if oldSchemaVersion < 1{} //like Column추가 (Automatic)
            if oldSchemaVersion < 2{} //like Column삭제 (Automatic)
            if oldSchemaVersion < 3{  //overView -> overview Column이름 변경(Manually)
                migration.renameProperty(onType: MyBookInfo.className(), from: "overView", to: "overview")
            }
            if oldSchemaVersion < 4{  //bookSummary Column추가, title + overview (Manually)
                migration.enumerateObjects(ofType: MyBookInfo.className()) { oldObject, newObject in
                    guard let new = newObject else {return}
                    guard let old = oldObject else {return}
                    guard let title = old["title"] else {return}
                    guard let overview = old["overview"] else {return}
                    
                    new["bookSummary"] = "제목은 '\(title)'이고, 내용은 '\(overview)'입니다"
                }
            }
            if oldSchemaVersion < 5 {} //bookSummary Column Optional해제 //옵셔널 해제도 기존 칼럼 지우고 새로운 칼럼 생성된 것으로 판단
            //renameProperty로 안되는데 어떻게 하 지 ?
            //왜 repository는 shared 안쓰고 instance 생성해서 사용했지 //쓰레드에서 안전하지 않음
            if oldSchemaVersion < 6 {} //text(Strig) Column추가 (기본 값은 뭘로 들어갈까? String = "")
            if oldSchemaVersion < 7 {} //number(Int) Column추가 (기본 값은 뭘로 들어갈까? Int = 0), (Bool = false)
            
        }
        
        Realm.Configuration.defaultConfiguration = config

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

