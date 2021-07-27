//
//  MovieListServiceViewModel.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/21/21.
//

import Foundation

import UIKit

class MovieListServiceViewModel: NSObject {
    
    weak var serviceManager: ServiceManagerProtocol? = ServiceManager.shared
    
    init(serviceManager: ServiceManagerProtocol = ServiceManager.shared) {
        self.serviceManager = serviceManager
    }
    
    func nowPlaying(_ completion: @escaping(MovieListResponseModel?, String?, Bool?) -> Void) {
        
        serviceManager?.nowPlaying() { (response: Result<MovieListResponseModel, NetworkError>) in
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
