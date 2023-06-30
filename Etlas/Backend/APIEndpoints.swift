//
//  APIEndpoints.swift
//  Etlas
//
//  Created by Hadir on 30/06/2023.
//

import Foundation

class APIEndpoints {
    static let baseURL = "http://20.19.184.149:8000"
    
    static var register: URL {
        return URL(string: baseURL + "/auth/register/")!
    }
    
    static var requestVerifyOTP: URL {
        return URL(string: baseURL + "/auth/request-verify-otp/")!
    }
    
    static var emailVerify: URL {
        return URL(string: baseURL + "/auth/email-verify/")!
    }
    
    static var login: URL {
        return URL(string: baseURL + "/auth/login/")!
    }
    
    static var logout: URL {
        return URL(string: baseURL + "/auth/logout/")!
    }
    
    static var refreshToken: URL {
        return URL(string: baseURL + "/auth/token/refresh/")!
    }
    
    // Add more endpoints as needed
}
