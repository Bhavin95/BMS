//
//  ServiceManagerExtension.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/17/21.
//

import UIKit
import Foundation

protocol ServiceManagerProtocol: class {
    
    func nowPlaying(_ requestModel: MovieListRequestModel, completion: @escaping(Result<MovieListResponseModel, NetworkError>) -> Void)
    func getMovieDetail(_ movieId: String, _ requestModel: MovieDetailRequestModel, completion: @escaping(Result<MovieDetailResponseModel, NetworkError>) -> Void)
    }

extension ServiceManager: ServiceManagerProtocol {
    func getMovieDetail(_ movieId: String, _ requestModel: MovieDetailRequestModel, completion: @escaping (Result<MovieDetailResponseModel, NetworkError>) -> Void) {
        let requestData = urlRequestWithValidation(urlPath: APIPath.Movie.nowPlaying + movieId, httpMethod: .get, headerParams: nil)
        
        guard let urlRequest = requestData.0 else {
            completion(Result.failure(requestData.1!))
            return
        }
        loadRequest(request: urlRequest, completion: completion)
    }
    
    func nowPlaying(_ requestModel: MovieListRequestModel, completion: @escaping (Result<MovieListResponseModel, NetworkError>) -> Void) {
        let requestData = urlRequestWithValidation(urlPath: APIPath.Movie.nowPlaying, httpMethod: .get, version: .v3, headerParams: nil)
        
        guard let urlRequest = requestData.0 else {
            completion(Result.failure(requestData.1!))
            return
        }
        loadRequest(request: urlRequest, completion: completion)
    }
}

enum APIVersion: String {
    case v3 = "3"
    case v4 = "4"
}

struct UPIResposeModel<T: Codable>: Codable {
    var status: Int?
    var success: Bool?
    var message: String?
    var dt: T?
    
    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case success = "Success"
        case message = "Message"
        case dt
    }
}

struct UPIResposeArrayModel<T: Codable>: Codable {
    let status: Int?
    let success: Bool?
    let message: String?
    let dt: [T]?
    
    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case success = "Success"
        case message = "Message"
        case dt
    }
}

extension ServiceManager {
    
    // MARK: Validate Request Methods
    func urlRequestWithValidation<T: Codable>(urlPath: String, httpMethod: HTTPMethod, version: APIVersion = .v4, query: String = "", requestData: T) -> (URLRequest?, NetworkError?) {
        
//        if #available(iOS 13.0, *) {
//            UIManager.showSpinner(onView: AppConstants.appDelegate.window?.rootViewController?.view ?? UIView())
//        } else {
//            // Fallback on earlier versions
//        }

        guard Reachability.isConnectedToNetwork() else {
            return (nil, NetworkError.badResponse(code: 501, description: "Can not connect to network! Please check your network/SIM and try again."))
        }
        guard let url =  URL(string: (urlPath.contains(ServerURL.base) ? "" : ServerURL.base) + version.rawValue + urlPath + query) else {
            return (nil, NetworkError.badUrl)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        let encoder = JSONEncoder()
        let data = try? encoder.encode(requestData)
        request.httpBody = data
        request.addValue(ContentType.applicationJSON.value, forHTTPHeaderField: "Content-Type")
        
        if let authToken = UserDefaultsManager.authToken() {
            request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }
        return (request, nil)
    }
    
    func urlRequestWithValidation(urlPath: String, httpMethod: HTTPMethod, version: APIVersion = .v4, headerParams: [String: String]?) -> (URLRequest?, NetworkError?) {
        
//        if #available(iOS 13.0, *) {
//                   UIManager.showSpinner(onView: AppConstants.appDelegate.window?.rootViewController?.view ?? UIView())
//               } else {
//                   // Fallback on earlier versions
//               }
        
        guard Reachability.isConnectedToNetwork() else {
            return (nil, NetworkError.badResponse(code: 501, description: "Can not connect to network! Please check your network/SIM and try again."))
        }
        guard let url =  URL(string: (urlPath.contains(ServerURL.base) ? "" : ServerURL.base) + version.rawValue + urlPath) else {
            return (nil, NetworkError.badUrl)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headerParams
        
        if let authToken = UserDefaultsManager.authToken() {
            request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }
        
        request.addValue(ContentType.applicationJSON.value, forHTTPHeaderField: "Content-Type")
        return (request, nil)
    }
    
    func sendRequest<T: Codable>(urlString: String, parameters: [String: Any]?, httpMethod: HTTPMethod = .post, requestModel: T? =  nil, programId: String? = nil, customerHash: String? = nil, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url =  URL(string: urlString) else {
            completion(.failure(.badUrl))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        if let authToken = UserDefaultsManager.authToken() {
            urlRequest.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }
        if let parameters = parameters {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted)
        }
        if let decodable = requestModel {
            let encoder = JSONEncoder()
            let data = try? encoder.encode(decodable)
            urlRequest.httpBody =  data
        }
        urlRequest.cachePolicy = .reloadRevalidatingCacheData
        loadRequest(request: urlRequest, completion: completion)
    }
}

public extension ServiceManager {
    
    func load<T: Decodable>(_ filename: String, bundle: Bundle?) -> T? {
        let data: Data
        guard let file = bundle?.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            return nil
        }
    }
}
