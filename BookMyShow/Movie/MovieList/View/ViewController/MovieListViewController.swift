//
//  MovieListViewController.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/17/21.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet private weak var searchContainerView: UIView!
    @IBOutlet private weak var movieListTableView: UITableView!
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var noMoviesLabel: UILabel!
    
    private lazy var movieListDataSource = MovieListDataSource()
    private var movieListServiceViewModel = MovieServiceViewModel()
    private var movieListResults = [Results]()
    private var movieListFilteredResults = [Results]()

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
        
        UIManager.showSpinner(onView: AppConstants.appDelegate.window?.rootViewController?.view ?? UIView())

        let request = MovieListRequestModel()
        movieListServiceViewModel.nowPlaying(request) { [weak self] (data, errorMessage, isSuccess)  in
            UIManager.removeSpinner()
            guard let self = self else {return}
            if isSuccess ?? false {
                if let movieListData = data?.results {
                    self.movieListResults = movieListData
                    self.movieListFilteredResults = movieListData
                    self.reloadScreen()
                }
            } else {
                UIManager.showAlert(msg: AppConstants.somethingWentWrong, completionBlock: nil)
            }
        }
    }
    
    private func reloadScreen() {
        self.movieListDataSource.movieList = self.movieListFilteredResults
        self.movieListDataSource.buildRows()
        if movieListFilteredResults.count <= 0 {
            noMoviesLabel.isHidden = false
        } else {
            noMoviesLabel.isHidden = true
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            if !updatedText.isEmpty {
                /* (\b pattern): checks if the keyword occurs at a word boundary */
                let pattern = "\\b" + NSRegularExpression.escapedPattern(for: updatedText)
                movieListFilteredResults = movieListResults.filter { $0.originalTitle!.range(of: pattern, options: [.regularExpression, .caseInsensitive]) != nil
                }
            } else {
                movieListFilteredResults = movieListResults
            }
            reloadScreen()
        }
        return true
    }

}

extension StringProtocol where Index == String.Index {
    func index(of string: Self, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    func endIndex(of string: Self, options: String.CompareOptions = []) -> Index? {
        return range(of: string, options: options)?.upperBound
    }
    func indexes(of string: Self, options: String.CompareOptions = []) -> [Index] {
        var result: [Index] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...].range(of: string, options: options) {
                result.append(range.lowerBound)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
    func ranges(of string: Self, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...].range(of: string, options: options) {
                result.append(range)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
