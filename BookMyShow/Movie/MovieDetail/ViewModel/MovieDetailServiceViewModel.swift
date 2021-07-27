//
//  MovieDetailServiceViewModel.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/25/21.
//

import Foundation

import UIKit

class MovieDetailServiceViewModel: NSObject {
    
    weak var serviceManager: ServiceManagerProtocol? = ServiceManager.shared
    
    init(serviceManager: ServiceManagerProtocol = ServiceManager.shared) {
        self.serviceManager = serviceManager
    }
    

    func getMovieDetail(_ movieId: String, _ completion: @escaping(MovieDetailResponseModel?, String?, Bool?) -> Void) {
        
        serviceManager?.getMovieDetail(movieId) { (response: Result<MovieDetailResponseModel, NetworkError>) in
            DispatchQueue.main.async {
                switch response {
                case .success(let result):
                    completion(result, "", true)
                case .failure(let error):
                    let errorMessage = self.handleFailure(error: error)
                    completion(nil, errorMessage, false)
                }
            }
        }
    }
    
    func getMovieReviews(_ urlPath: String, _ completion: @escaping(MovieReviewModel?, String?, Bool?) -> Void) {
        
        serviceManager?.getMovieReviews(urlPath) { (response: Result<MovieReviewModel, NetworkError>) in
            DispatchQueue.main.async {
                switch response {
                case .success(let result):
                    completion(result, "", true)
                case .failure(let error):
                    let errorMessage = self.handleFailure(error: error)
                    completion(nil, errorMessage, false)
                }
            }
        }
    }
    
    func getMovieCredits(_ urlPath: String, _ completion: @escaping (MovieCreditsModel?, String?, Bool?) -> Void) {
        
        serviceManager?.getMovieCredits(urlPath) { (response: Result<MovieCreditsModel, NetworkError>) in
            DispatchQueue.main.async {
                switch response {
                case .success(let result):
                    completion(result, "", true)
                case .failure(let error):
                    let errorMessage = self.handleFailure(error: error)
                    completion(nil, errorMessage, false)
                }
            }
        }
    }
    
    func getSimilarMovies(_ urlPath: String, _ completion: @escaping (MovieListResponseModel?, String?, Bool?) -> Void) {
        
        serviceManager?.getSimilarMovies(urlPath) { (response: Result<MovieListResponseModel, NetworkError>) in
            DispatchQueue.main.async {
                switch response {
                case .success(let result):
                    completion(result, "", true)
                case .failure(let error):
                    let errorMessage = self.handleFailure(error: error)
                    completion(nil, errorMessage, false)
                }
            }
        }
    }
    
    private func handleFailure(error: NetworkError) -> String {
        switch error {
        case .badErrorResponse(_, let statusMessage,_):
            return statusMessage ?? AppConstants.somethingWentWrong
        default:
            return AppConstants.somethingWentWrong
        }
    }
}
