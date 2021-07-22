//
//  MovieListViewController.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/17/21.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak private var searchContainerView: UIView!
    @IBOutlet weak private var movieListTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    private lazy var movieListDataSource = MovieListDataSource()
    private var movieListServiceViewModel = MovieServiceViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nowPlayingMovie()
    }
    
    private func initialSetup() {
        view.addGradientLayer(APPStyle.Color.backgroundStartGradient, APPStyle.Color.backgroundEndGradient)
        searchContainerView.clipsToBounds = true
        searchContainerView.layer.borderWidth = 1
        searchContainerView.layer.borderColor = APPStyle.Color.disabledGrey.cgColor
        searchContainerView.layer.cornerRadius = 20.0
        
        movieListTableView.register(UINib.init(nibName: MovieListTableCell.xibName, bundle: nil), forCellReuseIdentifier: MovieListTableCell.reuseIdentifier)
        movieListTableView.dataSource = movieListDataSource
        movieListTableView.delegate = movieListDataSource
        movieListDataSource.delegate = self
        searchTextField.delegate = self
    }
    
    private func nowPlayingMovie() {
        
        let request = MovieListRequestModel()
        
        movieListServiceViewModel.nowPlaying(request) { [weak self] (data, errorMessage, isSuccess)  in
            //UIManager.removeSpinner()
            guard let self = self else {return}
            if isSuccess ?? false {
                if let movieListModel = data {
                    self.movieListDataSource.movieList = movieListModel.results ?? [Results]()
                    self.movieListDataSource.buildRows()
                }
            } else {
                //self.showToast(message: errorMessage ?? "")
            }
        }
    }
}

extension MovieListViewController: MovieListDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.movieListTableView.reloadData()
        }
    }
    
    func bookButtonAction(_ results: Results?) {
        if let results = results {
            print(results)
        }
    }
}

extension MovieListViewController: UITextFieldDelegate {
    
}
