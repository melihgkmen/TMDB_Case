//
//  DetailViewController.swift
//  TMDB_Case
//
//  Created by Melih Gökmen on 6.03.2022.
//

import Foundation
import Alamofire

private let apikey = "f1f74c2c58ce6eedc7095586802528d7"
private let language = "en-EN"

private enum URLKeys: String {
    case search = "search/movie"
    case nowPlaying = "movie/now_playing"
    case upcoming = "movie/upcoming"
    case detail = "movie/"
    case imdbUrl = "https://imdb.com/title/"
    
}

class DataProvider {
    func fetchNowPlaying(completion: @escaping (MovieListResult) -> Void) {
        let request = AF.request(self.urlCreator(callType: .nowPlaying, page: 1))
        request.responseJSON { (result) in
            if let data = result.data {
                do {
                    let list = try JSONDecoder().decode(MovieList.self, from: data)
                    completion(.success(list))
                } catch {
                    completion(.failure("Symbol List error"))
                }
            }
        }
    }
    
    func fetchUpcoming(page: Int, completion: @escaping (MovieListResult) -> Void) {
        let request = AF.request(self.urlCreator(callType: .upcoming, page: page))
        request.responseJSON { (result) in
            if let data = result.data {
                do {
                    let list = try JSONDecoder().decode(MovieList.self, from: data)
                    completion(.success(list))
                } catch {
                    completion(.failure("Symbol List error"))
                }
            }
        }
    }
    
    func queryMovies(query: String, page: Int, completion: @escaping (MovieListResult) -> Void) {
        let additionalParams = "&query=\(query)&include_adult=false"
        let request = AF.request(self.urlCreator(callType: .search, page: page, additionalParams: additionalParams))
        request.responseJSON { (result) in
            if let data = result.data {
                do {
                    let list = try JSONDecoder().decode(MovieList.self, from: data)
                    completion(.success(list))
                } catch {
                    completion(.failure("Symbol List error"))
                }
            }
        }
    }
    
    func queryMovieDetail(movieID: String, completion: @escaping (MovieDetailResult) -> Void) {
        let request = AF.request(self.urlCreator(callType: .detail, id: movieID))
        request.responseJSON { (result) in
            if let data = result.data {
                do {
                    let item = try JSONDecoder().decode(MovieDetail.self, from: data)
                    completion(.success(item))
                } catch {
                    completion(.failure("Symbol List error"))
                }
            }
        }
    }
    
    private func urlCreator(callType: URLKeys, page: Int? = nil, id: String? = nil, additionalParams: String? = nil) -> String {
        var url = "https://api.themoviedb.org/3/"
        url += callType.rawValue
        if let id = id {
            url += id
        }
        url += ("?api_key=" + apikey)
        url += ("&language=" + language)
        if let page = page {
            url += ("&page=" + String(page))
        }
        if let additionalParams = additionalParams {
            url += additionalParams
        }
        return url
    }
}
