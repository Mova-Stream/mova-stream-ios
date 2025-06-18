//
//  Movie.swift
//  MovaStream
//
//  Created by HauNguyen on 27/04/2566 BE.
//

import Foundation

struct Movie: Codable {
    init() {
        self.title = ""
        self.backdrop_path = ""
        self.media_type = ""
        self.release_date = ""
        self.first_air_date = ""
        self.genre_ids = []
        self.id = 0
        self.name = ""
        self.origin_country = []
        self.original_language = ""
        self.original_name = ""
        self.overview = ""
        self.popularity = 0
        self.poster_path = ""
        self.vote_average = 0
        self.vote_count = 0
    }
    
    init(title: String, backdrop_path: String, media_type: String? = nil, release_date: String? = nil, first_air_date: String? = nil, genre_ids: [Double], id: Double, name: String? = nil, origin_country: [String]? = nil, original_language: String, original_name: String? = nil, overview: String, popularity: Double, poster_path: String? = nil, vote_average: Double, vote_count: Double) {
        self.title = title
        self.backdrop_path = backdrop_path
        self.media_type = media_type
        self.release_date = release_date
        self.first_air_date = first_air_date
        self.genre_ids = genre_ids
        self.id = id
        self.name = name
        self.origin_country = origin_country
        self.original_language = original_language
        self.original_name = original_name
        self.overview = overview
        self.popularity = popularity
        self.poster_path = poster_path
        self.vote_average = vote_average
        self.vote_count = vote_count
    }
    
    let title: String
    let backdrop_path: String
    let media_type: String?
    let release_date: String?
    let first_air_date: String?
    let genre_ids: [Double]
    let id: Double
    let name: String?
    let origin_country: [String]?
    let original_language: String
    let original_name: String?
    let overview: String
    let popularity: Double
    let poster_path: String?
    let vote_average: Double
    let vote_count: Double
}

let tmdbs: [RowMovieCellModel] = [
    RowMovieCellModel(rowName: "Netflix Originals", movies: [
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756)
    ]),
    RowMovieCellModel(rowName: "Trending Now", movies: [
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756)
    ]),
    RowMovieCellModel(rowName: "Top Rates", movies: [
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756),
        Movie(title: "The Super Mario Bros. Movie", backdrop_path: "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg", media_type: "", release_date: "2023-04-05", first_air_date: "", genre_ids: [16, 12, 10751, 14, 35], id: 502356, name: "", origin_country: [""], original_language: "en", original_name: "", overview: "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.", popularity: 9032.947, poster_path: "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg", vote_average: 7.5, vote_count: 756)
    ])
]
