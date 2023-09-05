//
//  MyBookInfo.swift
//  BOOKWARM
//
//  Created by 임영준 on 2023/09/04.
//

import Foundation
import RealmSwift

class MyBookInfo: Object {

    @Persisted(primaryKey: true) var _id : ObjectId
    @Persisted var title: String
    @Persisted var thumb: String
    @Persisted var overView: String
    @Persisted var date: String
    @Persisted var author: String
    @Persisted var price: Int
    @Persisted var memo: String?
    
    convenience init(title: String, thumb: String, overView: String, date: String, author: String, price: Int) {
        self.init()
        self.title = title
        self.thumb = thumb
        self.overView = overView
        self.date = date
        self.author = author
        self.price = price
    }
}
