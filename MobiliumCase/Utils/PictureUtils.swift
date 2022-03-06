//
//  DetailViewController.swift
//  TMDB_Case
//
//  Created by Melih Gökmen on 6.03.2022.
//

import Foundation

private let baseURL = "https://image.tmdb.org/t/p"
private let pictureWidth = "/w500"

class PictureUtils: NSObject {
    static func createPictureURL(path: String?) -> URL? {
        if let path = path {
            return URL(string: (baseURL + pictureWidth + path))
        }
        return URL(string: "https://omegamma.com.au/wp-content/uploads/2017/04/default-image.jpg")
    }
}
