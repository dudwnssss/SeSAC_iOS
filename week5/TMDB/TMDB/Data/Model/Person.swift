//
//  Person.swift
//  TMDB
//
//  Created by 임영준 on 2023/09/01.
//

import Foundation

// MARK: - Person
struct Person: Codable {
    let page: Int
    let results: [ResultPerson]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ResultPerson: Codable {
    let adult: String
    let id: Int
    let name, originalName: String
    let mediaType: String
    let popularity: Double
    let gender: Int
    let knownForDepartment: String
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case adult, id, name, popularity, gender
        case originalName = "original_name"
        case mediaType = "media_type"
        case knownForDepartment = "known_for_department"
        case profilePath = "profile_path"
    }
}

