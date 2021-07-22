//
//  HomeViewController.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/22/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        startButton.layer.cornerRadius = 8.0
    }
    
    @IBAction func startAction(_ sender: Any) {
        let movieListViewController = MovieListViewController(nibName: "MovieListViewController", bundle: nil)
        navigationController?.pushViewController(movieListViewController, animated: true)
    }
}
