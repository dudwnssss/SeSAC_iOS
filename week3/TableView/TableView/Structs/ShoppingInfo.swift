//
//  ShoppingInfo.swift
//  TableView
//
//  Created by 임영준 on 2023/07/28.
//

import Foundation

struct ShoppingItem{
    var check: Bool
    var title: String
    var like: Bool
}

struct ShoppingInfo{
    var shoppingList: [ShoppingItem] = [ShoppingItem(check: true, title: "그립톡 구매하기", like: true),
                                        ShoppingItem(check: false, title: "사이다 구매", like: false),
                                        ShoppingItem(check: false, title: "아이패드 케이스 최저가 알아보기", like: true),
                                        ShoppingItem(check: false, title: "양말", like: true),
    ]
}


