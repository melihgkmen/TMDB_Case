//
//  DetailViewController.swift
//  TMDB_Case
//
//  Created by Melih Gökmen on 6.03.2022.
//

import Foundation

struct MovieDetail: Decodable {
    let adult: Bool
    let backdrop_path: String?
    let belongs_to_collection: MovieCollection?
    let budget: Int
    let genres: [Genre]?
    let homepage: String?
    let id: Int
    let imdb_id: String?
    let original_language: String
    let original_title: String
    let overview: String?
    let popularity: Double
    let poster_path: String?
    let production_companies: [Company]
    let production_countries: [Country]
    let release_date: String
    let revenue: Double
    let runtime: Int?
    let spoken_languages: [Language]
    let status: String
    let tagline: String?
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}

struct MovieCollection: Decodable {
    let id: Int
    let name: String
    let poster_path: String?
    let backdrop_path: String?
}

struct Genre: Decodable {
    let id: Int
    let name: String
}

struct Company: Decodable {
    let id: Int
    let name: String
    let logo_path: String?
    let origin_country: String
}

struct Country: Decodable {
    let iso_3166_1: String
    let name: String
}

struct Language: Decodable {
    let iso_639_1: String
    let name: String
}

enum MovieDetailResult {
    case success(MovieDetail)
    case failure(String)
}
