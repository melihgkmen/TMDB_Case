//
//  DetailViewController.swift
//  TMDB_Case
//
//  Created by Melih Gökmen on 6.03.2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var movieID: String!
    private var viewModel: DetailViewModelProtocol!

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var infoText: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = DetailViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let movieID = self.movieID {
            self.viewModel.fetchMovieDetail(movieID: movieID) { [unowned self] in
                if let movie = self.viewModel.getCurrentMovie() {
                    self.posterImage.kf.setImage(with: PictureUtils.createPictureURL(path: movie.backdrop_path))
                    self.titleLabel.text = movie.title
                    self.ratingLabel.text = String(movie.vote_average)
                    self.infoText.text = movie.overview
                    self.dateLabel.text = movie.release_date
                }
            }
        }
    }
}
