//
//  DetailViewController.swift
//  TMDB_Case
//
//  Created by Melih Gökmen on 6.03.2022.
//

import Foundation

protocol SearchViewModelProtocol {
    func queryMovies(query: String, completion: (() -> ())?)
    func hasMoreSearchResults() -> Bool
    func numberOfSearchResults() -> Int
    func searchResultAtIndex(atIndex: Int) -> Movie
    func fetchMoreResults(completion: (() -> ())?)
}


class SearchViewModel: NSObject, SearchViewModelProtocol {
    
    private lazy var provider = DataProvider()
    private var searchResults: [Movie] = []
    private var searchResultsCurrentPage = 0
    private var searchResultsTotalPage = 0
    private var lastQuery = ""
    
    func queryMovies(query: String, completion: (() -> ())?) {
        self.searchResults.removeAll()
        self.searchResultsCurrentPage = 0
        self.searchResultsTotalPage = 0
        self.makeQuery(query: query, completion: completion)
        self.lastQuery = query
    }
    
    func fetchMoreResults(completion: (() -> ())?) {
        self.makeQuery(query: self.lastQuery, completion: completion)
    }
    
    private func makeQuery(query: String, completion: (() -> ())?) {
        provider.queryMovies(query: query, page: (self.searchResultsCurrentPage + 1)) { [unowned self] (result) in
            switch (result) {
            case .success(let movies):
                self.searchResults.append(contentsOf: movies.results)
                self.searchResultsCurrentPage = movies.page
                self.searchResultsTotalPage = movies.total_pages
                completion?()
            case .failure(let error):
                print(error)
                completion?()
            }
        }
    }
    
    func hasMoreSearchResults() -> Bool {
        if self.searchResultsCurrentPage == self.searchResultsTotalPage && self.searchResultsCurrentPage != 0 {
            return false
        }
        return true
    }
    
    func numberOfSearchResults() -> Int {
        return self.searchResults.count
    }
    
    func searchResultAtIndex(atIndex: Int) -> Movie {
        return self.searchResults[atIndex]
    }
    
    
}
