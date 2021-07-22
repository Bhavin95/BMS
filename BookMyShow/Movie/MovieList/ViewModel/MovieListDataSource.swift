//
//  MovieListDataSource.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/17/21.
//

import UIKit

protocol MovieListDelegate: class {
    func reloadData()
    func bookButtonAction(_ results: Results?)
}
class MovieListDataSource: NSObject {
    private lazy var rows = [Results]()
    weak var delegate: MovieListDelegate?
    var movieList = [Results]()
    
    private func buildMovieListRows() -> [Results] {
        return movieList
    }

    func buildRows() {
        rows = buildMovieListRows()
        self.delegate?.reloadData()
    }
}

extension MovieListDataSource: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return rows.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTableCell.reuseIdentifier, for: indexPath) as! MovieListTableCell
        cell.delegate = self
        cell.setData(rows[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - MovieListTableCellDelegate

extension MovieListDataSource: MovieListTableCellDelegate {
    func buyOrRentAction(_ results: Results?) {
        delegate?.bookButtonAction(results)
    }
}
