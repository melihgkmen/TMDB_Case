//
//  DetailViewController.swift
//  TMDB_Case
//
//  Created by Melih Gökmen on 6.03.2022.
//

import UIKit
import Kingfisher

class UpcomingCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var originalTitleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.moviePoster.kf.cancelDownloadTask()
        self.moviePoster.image = nil
    }
    
    func configureCell(movie: Movie) {
        if let imageURL = movie.poster_path, let downloadURL = PictureUtils.createPictureURL(path: imageURL) {
            self.moviePoster.kf.setImage(with: downloadURL, placeholder: nil, options: [.processor(DownsamplingImageProcessor(size: self.moviePoster.frame.size)), .scaleFactor(UIScreen.main.scale), .cacheOriginalImage
            ], progressBlock: nil)
        }
        self.titleLabel.text = movie.title
        self.originalTitleLabel.text = movie.overview
        self.infoLabel.text = movie.release_date
        
    }

}
