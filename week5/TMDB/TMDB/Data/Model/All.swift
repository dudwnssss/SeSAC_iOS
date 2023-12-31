//
//  All.swift
//  TMDB
//
//  Created by 임영준 on 2023/09/01.
//

import Foundation

// MARK: - All
struct All: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let name: String?
    let originalLanguage: String
    let originalName: String?
    let overview, posterPath: String
    let mediaType: MediaType
    let genreIDS: [Int]
    let popularity: Double
    let firstAirDate: String?
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [String]?
    let title, originalTitle, releaseDate: String?
    let video: Bool?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, name
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
        case title
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case video
    }
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let convertDate = dateFormatter.date(from: releaseDate!)
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "MM/dd/yyyy"
        let convertStr = myDateFormatter.string(from: convertDate!)
        return convertStr
    }
    
    var rate: String {
        let digit: Double = pow(10, 1)
        let rate = floor(voteAverage * digit) / digit
        return "\(rate)"
    }
}

enum MediaType: String, CaseIterable, Codable{
    case tv = "tv"
    case movie = "movie"
    case person = "person"
    
    var contentURL: String{
        switch self {
        case .tv:
            return "/tv"
        case .movie:
            return "/movie"
        case .person:
            return "/person"
        }
    }
    
//    var Model: Decodable {
//        switch self {
//        case .tv:
//            return TV.self
//        case .movie:
//            return Movie.self
//        case .person:
//            return Person.self
//        case .all:
//            return All.self
//        }
//    }
}
