//
//  Photo.swift
//  UnsplashRandom
//
//  Created by 임영준 on 2023/09/18.
//

import Foundation

// MARK: - Photo
struct Photo: Codable, Hashable {
    let id: String
    let urls: Urls
}

// MARK: - Urls
struct Urls: Codable, Hashable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
