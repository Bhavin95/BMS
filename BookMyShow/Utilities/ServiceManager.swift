//
//  ServiceManager.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/17/21.
//

import Foundation

public extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: [])).flatMap { $0 as? [String: Any] }
    }
}

public enum NetworkError: Error {
    case noInternetError
    case domainError
    case decodingError
    case badUrl
    case business
    case badResponse(code: Int?, description: String?)
    case badErrorResponse(status_code: Int?, status_message: String?, success: Bool?)
    case badAllErrorResponse(code: Int?, description: String?, errorCode: String?, errorMessage: String?, errorReason: String?, error: String?)
}

public enum APIKey: String {
    case key = "api_key"
    case value = "0ab610edbc064aa9f03c0ad4e5f2399d"
}

struct ServerURL {
    static var base = "https://api.themoviedb.org/"
}

public class ServiceManager {
    public static let shared = ServiceManager()
    let cache =  URLCache.shared
    let cacheExpiryDays: Int = 7
    
    public func loadRequest<T: Codable>(request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        if !Reachability.isConnectedToNetwork() {
            DispatchQueue.main.async {
                completion(.failure(.noInternetError))
            }
            return
        }
        
        let session = URLSession.init(configuration: .ephemeral, delegate: URLSessionPinningDelegate(), delegateQueue: nil)
        session.dataTask(with: request) { (data, response, error) in

            if let error = error as NSError?, error.domain == NSURLErrorDomain {
                DispatchQueue.main.async {
                    completion(.failure(.domainError))
                }
                return
            } else {
                
                if let response = response, let data = data, !response.isSuccess {
                    do {
                        let result = try JSONDecoder().decode(ErrorResponse.self, from: data)
                        let error = NetworkError.badErrorResponse(status_code: result.status_code, status_message: result.status_message, success: result.success)
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                        return
                    } catch {
                        DispatchQueue.main.async {
                            completion(.failure(.decodingError))
                        }
                        return
                    }
                }
                
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)

                        DispatchQueue.main.async {
                            completion(.success(result))
                        }
                    } catch {
                        DispatchQueue.main.async {
                            completion(.failure(.decodingError))
                        }
                    }
                }
            }
        }.resume()
    }
}

// MARK: Caching
extension ServiceManager {

    private func cacheResponse(data: Data, request: URLRequest, response: URLResponse?) {
        if let response = response {
            let cachedData = CachedURLResponse(response: response, data: data)
            cache.storeCachedResponse(cachedData, for: request)
        }
    }

    private func removeExpiredCachedData() {
        if let expiryDate = Calendar.current.date(byAdding: .day, value: -cacheExpiryDays, to: Date()) {
            cache.removeCachedResponses(since: expiryDate)
        }
    }
}

class URLSessionPinningDelegate: NSObject, URLSessionDelegate {

    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void) {
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust, let trust = challenge.protectionSpace.serverTrust {
                completionHandler(.useCredential, URLCredential(trust: trust))
            } else {
                completionHandler(.performDefaultHandling, nil)
            }
    }
}

public extension URLResponse {
    
    var isSuccess: Bool {
        return httpStatusCode >= 200 && httpStatusCode < 300
    }

    var httpStatusCode: Int {
        guard let statusCode = (self as? HTTPURLResponse)?.statusCode else {
            return 0
        }
        return statusCode
    }
}

struct ErrorResponse: Codable {
    let status_message: String?
    let status_code: Int?
    let success: Bool?
}

enum ContentType: String {
    case applicationJSON
    case formUrlEncoded
    
    var value: String {
        switch self {
        case .applicationJSON:
            return "application/json"
        case .formUrlEncoded:
            return "application/x-www-form-urlencoded; charset=UTF-8"
        }
    }
}

public struct APIPath {
    static let movie = "/movie"
    static let credits = "/credits"
    static let reviews = "/reviews"
    static let similar = "/similar"
    
    struct Movie {
        static let nowPlaying = "/movie/now_playing"
        
    }
}
