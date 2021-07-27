//
//  MovieDetailViewController.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/25/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var languageLabel: UILabel!
    @IBOutlet private weak var overViewLabel: UILabel!
    @IBOutlet private weak var rentButton: UIButton!
    
    private var movieDetailServiceViewModel = MovieDetailServiceViewModel()
    var movieListResultsModel: Results?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initialSetup()
    }
    
    private func initialSetup() {
        rentButton.layer.cornerRadius = 8.0
        DispatchQueue.main.async {
            if let url = URL(string: "\(AppConstants.imageBaseUrl + "\(self.movieListResultsModel?.posterPath ?? "")")") {
                UIImage.loadFrom(url: url) { image in
                    self.posterImageView.image = image
                }
            }
        }
        self.titleLabel.text = movieListResultsModel?.originalTitle
        self.languageLabel.text = movieListResultsModel?.originalLanguage == "en" ? "English" : "USA"
        self.overViewLabel.text = movieListResultsModel?.overview
    }
}
