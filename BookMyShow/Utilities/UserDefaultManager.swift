//
//  UserDefaultManager.swift
//  BookMyShow
//
//  Created by Bhavin  Nagaria on 7/17/21.
//

import Foundation

public enum authorizationToken: String {
    case key = "authToken"
    case value = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYWI2MTBlZGJjMDY0YWE5ZjAzYzBhZDRlNWYyMzk5ZCIsInN1YiI6IjYwZjUxOTIyNDBkMGZlMDA0N2M3ZmM4MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.QcZFBaEZJmtbZWNjTk4MHltpyW8F1Yq5zAB28BxwYJ4"
}

class UserDefaultsManager {
    
    private static let userDefault = UserDefaults.standard
    
    static func saveAuthToken(token: String) {
        userDefault.set(token, forKey: authorizationToken.key.rawValue)
    }
    
    static func authToken() -> String? {
        if let token = userDefault.object(forKey: authorizationToken.key.rawValue) as? String {
            return token
        }
        return ""
    }

    static func clear() {
        userDefault.removeObject(forKey: authorizationToken.key.rawValue)
    }
}
