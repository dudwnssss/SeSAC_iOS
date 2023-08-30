//
//  URLConstant.swift
//  PhotoGram
//
//  Created by 임영준 on 2023/08/30.
//

import Foundation
//https://api.unsplash.com/search/photos/?client_id=O1lB6mO6V15goTBwglgKLzb1oXKKrQiy9aGDsoadROY&query=office
struct URLConstant {
    static let baseURL = "https://api.unsplash.com"
    static let searchURL = "/search/photos"
    static let clinetID = "/?client_id=\(APIKey.unsplash)"
    static let queryURL = "&query="
    
    static var searchImageURL: String {
        return baseURL+searchURL+clinetID+queryURL
    }
}
