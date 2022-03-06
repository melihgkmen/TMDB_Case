//
//  DetailViewController.swift
//  TMDB_Case
//
//  Created by Melih Gökmen on 6.03.2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var queryField: UITextField!
    @IBOutlet weak var searchResultsTable: UITableView!
    
    private var viewModel: SearchViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewModel = SearchViewModel()
        self.searchResultsTable.delegate = self
        self.searchResultsTable.dataSource = self
        self.queryField.delegate = self
    }
    
    @IBAction func searchAction(_ sender: Any) {
        if let query = self.queryField.text, query.count > 0 {
            self.query(query: query)
        }
    }
    
    func openDetail(movieID: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        controller.movieID = movieID
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func query(query: String) {
        self.viewModel.queryMovies(query: query) { [unowned self] in
            self.searchResultsTable.reloadData()
        }
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfSearchResults()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell {
            let movie = self.viewModel.searchResultAtIndex(atIndex: indexPath.row)
            cell.configureCell(movie: movie)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.openDetail(movieID: String(self.viewModel.searchResultAtIndex(atIndex: indexPath.row).id))
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.viewModel.numberOfSearchResults() - 2 && self.viewModel.hasMoreSearchResults() {
            self.viewModel.fetchMoreResults { [unowned self] in
                self.searchResultsTable.reloadData()
            }
        }
    }
    
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let query = self.queryField.text, query.count > 0 {
            self.query(query: query)
        }
        return true
    }
}
