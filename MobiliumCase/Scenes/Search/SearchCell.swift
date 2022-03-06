//
//  DetailViewController.swift
//  TMDB_Case
//
//  Created by Melih Gökmen on 6.03.2022.
//

import UIKit
import Kingfisher

class SearchCell: UITableViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.posterImage.kf.cancelDownloadTask()
        self.posterImage.image = nil
    }
    
    func configureCell(movie: Movie) {
        if let imageURL = movie.backdrop_path, let downloadURL = PictureUtils.createPictureURL(path: imageURL) {
            self.posterImage.kf.setImage(with: downloadURL, placeholder: nil, options: [.processor(DownsamplingImageProcessor(size: self.posterImage.frame.size)), .scaleFactor(UIScreen.main.scale), .cacheOriginalImage
            ], progressBlock: nil)
        }
        self.titleLabel.text = movie.title
        self.infoLabel.text = movie.overview
        
    }

}
