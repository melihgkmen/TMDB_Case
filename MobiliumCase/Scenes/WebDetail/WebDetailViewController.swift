//
//  WebDetailViewController.swift
//  MobiliumCase
//
//  Created by Melih Gökmen on 6.03.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webkitView: WKWebView!
    
    var imdbId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imdbUrl: String = "https://imdb.com/title/"
        if let id = self.imdbId, let url = URL(string: imdbUrl + id) {
            let request = URLRequest(url: url)
            webkitView.load(request)
            webkitView.allowsBackForwardNavigationGestures = true
        }
        
    }
}
