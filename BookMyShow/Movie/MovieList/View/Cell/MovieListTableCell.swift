//
//  MovieListTableCell.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/17/21.
//

import UIKit

protocol MovieListTableCellDelegate: AnyObject {
    func buyOrRentAction(_ results: Results?)
}

class MovieListTableCell: UITableViewCell, TableCellGettable {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak private var movieNameLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var releaseDateLabel: UILabel!
    @IBOutlet weak var buyOrRentButton: UIButton!
    
    weak var delegate: MovieListTableCellDelegate?
    var resultsData: Results?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImageView.layer.cornerRadius = 10.0
        buyOrRentButton.layer.cornerRadius = 6.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ results: Results) {
        if let url = URL(string: "\(AppConstants.imageBaseUrl + "\(results.posterPath ?? "")")") {
            UIImage.loadFrom(url: url) { image in
                self.movieImageView.image = image
            }
        }
        movieNameLabel.text = results.originalTitle
        releaseDateLabel.text = results.releaseDate
        descriptionLabel.text = results.overview
        resultsData = results
    }
    
    @IBAction private func buyOrRentAction(_ sender: Any) {
        delegate?.buyOrRentAction(resultsData)
    }
}
