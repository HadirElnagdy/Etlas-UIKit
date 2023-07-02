//
//  APIRouter.swift
//  Etlas
//
//  Created by Hadir on 01/07/2023.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    //auth
    case register(fullName:String, email: String, password: String, address: String, phoneNumber: String)
    case verifyEmail(OTP: String)
    case requestNewOTP(email: String)
    case refreshToken(token: String)
    case login(email: String, password: String)
    case logout(refreshToken: String)
    case resetPassword(email: String)
    case confirmPasswordReset(password: String, confirmPassword: String, token: String, userId: String)
    case verifyPasswordOTP(OTP: String)
    case changePassword(oldPassword: String, newPassword: String, confirmNewPassword: String)
    case googleSignIn(authToken: String, frontEnd: String)
    case facebookSignIn(authToken: String)
    
    
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .register, .verifyEmail, .requestNewOTP, .login, .logout, .refreshToken, .resetPassword, .verifyPasswordOTP, .changePassword, .googleSignIn, .facebookSignIn:
            return .post
        case .confirmPasswordReset:
            return .patch
        default:
            return .get
        }
    }
    
    private var isAuthenticated: Bool {
        switch self {
        case .register, .verifyEmail, .requestNewOTP, .login, .logout, .refreshToken, .resetPassword, .verifyPasswordOTP, .changePassword, .googleSignIn, .facebookSignIn, .confirmPasswordReset:
            return true
        default:
            return false
        }
    }
    
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .register:
            return APIEndpoints.register
        case .verifyEmail:
            return APIEndpoints.verifyEmail
        case .requestNewOTP:
            return APIEndpoints.requestNewOTP
        case .login:
            return APIEndpoints.login
        case .logout:
            return APIEndpoints.logout
        case .refreshToken:
            return APIEndpoints.refreshToken
        case .resetPassword:
            return APIEndpoints.resetPassword
        case .confirmPasswordReset:
            return APIEndpoints.confirmPasswordReset
        case .verifyPasswordOTP:
            return APIEndpoints.verifyPasswordOTP
        case .changePassword:
            return APIEndpoints.changePassword
        case .googleSignIn:
            return APIEndpoints.googleSignIn
        case .facebookSignIn:
            return APIEndpoints.facebookSignIn
            
        }
    }
    
    // MARK: - Parameters
    private var parameters: [String: String]? {
        switch self {
        case .register(
            fullName: let fullName,
            email: let email,
            password: let password,
            address: let address,
            phoneNumber: let phoneNumber
        ):
            return [
                APIParameterKey.email: email,
                APIParameterKey.fullName: fullName,
                APIParameterKey.password: password,
                APIParameterKey.confirmPassword: password,
                APIParameterKey.address: address,
                APIParameterKey.phoneNumber: phoneNumber
            ]
            
        case .verifyEmail(OTP: let OTP):
            return [APIParameterKey.OTP: OTP]
            
        case .requestNewOTP(email: let email):
            return [APIParameterKey.email: email]
            
        case .refreshToken(token: let token):
            return [APIParameterKey.refreshToken: token]
            
        case .login(email: let email, password: let password):
            return [APIParameterKey.email: email, APIParameterKey.password: password]
            
        case .logout(refreshToken: let refreshToken):
            return [APIParameterKey.refreshToken: refreshToken]
            
        case .resetPassword(email: let email):
            return [APIParameterKey.email: email]
            
        case .confirmPasswordReset(password: let password, confirmPassword: let confirmPassword, token: let token, userId: let userId):
            return [
                APIParameterKey.password: password,
                APIParameterKey.confirmPassword: confirmPassword,
                APIParameterKey.token: token,
                APIParameterKey.userId: userId
            ]
            
        case .verifyPasswordOTP(OTP: let OTP):
            return [APIParameterKey.OTP: OTP]
            
        case .changePassword(oldPassword: let oldPassword, newPassword: let newPassword, confirmNewPassword: let confirmNewPassword):
            return [
                APIParameterKey.oldPassword: oldPassword,
                APIParameterKey.newPassword: newPassword,
                APIParameterKey.confirmNewPassword: confirmNewPassword
            ]
            
        case .googleSignIn(authToken: let authToken, frontEnd: let frontEnd):
            return [APIParameterKey.authToken: authToken, APIParameterKey.frontEnd: frontEnd]
            
        case .facebookSignIn(authToken: let authToken):
            return [APIParameterKey.authToken: authToken]
        default:
            return[:]
        }
        
    }
    
    private var encoding: ParameterEncoding {
        switch self {
            //        case .allCategories, .homeExperts, .testimonials, .allExperts, .categoryDetails, .allBlogs, .aboutUs, .homeCategories, .blogDetails:
            //            return URLEncoding(destination: .queryString)
        default:
            return JSONEncoding.init(options: .sortedKeys)
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try APIEndpoints.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        return try encoding.encode(urlRequest, with: parameters)
    }
}
