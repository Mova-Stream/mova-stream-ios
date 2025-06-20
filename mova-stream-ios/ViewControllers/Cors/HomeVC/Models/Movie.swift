//
//  Movie.swift
//  mova-stream-ios
//
//  Created by HAU NGUYEN on 20/6/25.
//
import Foundation

struct Movie: Codable {
    let title: String
    let backdropPath: String
    let mediaType: String?
    let releaseDate: String?
    let firstAirDate: String?
    let genreIds: [Double]
    let id: Double
    let name: String?
    let originCountry: [String]?
    let originalLanguage: String
    let originalName: String?
    let overview: String
    let popularity: Double
    let posterPath: String?
    let voteAverage: Double
    let voteCount: Double
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case backdropPath = "backdrop_path"
        case mediaType = "media_type"
        case releaseDate = "release_date"
        case firstAirDate = "first_air_date"
        case genreIds = "genre_ids"
        case id = "id"
        case name = "name"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
