//
//  AuthService.swift
//  Etlas
//
//  Created by Hadir on 30/06/2023.
//

import Foundation

class AuthService {
    static let shared = AuthService()
    
    private let baseURL = "http://20.19.184.149:8000/auth"
    
    private init() {}
    
    func register(fullName: String, email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        let registerURL = URL(string: baseURL + "/register")!
        
        let parameters: [String: Any] = [
            "full_name": fullName,
            "email": email,
            "password": password
        ]
        
//        BackendService.shared.performRequest(url: registerURL, method: "POST", parameters: parameters) { result in
//            // Handle the response and parse user data
//            // Call the completion handler with the result
//        }
    }
    
    // Implement additional methods for other authentication endpoints
    // ...
}
