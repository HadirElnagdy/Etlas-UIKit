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
    case register(fullName:String, email: String, password: String, confirmPassword: String, address: String, phoneNumber: String)
    case verifyEmail(OTP: String)
    case requestNewOTP(email: String)
    case refreshToken(token: String)
    case login(email: String, password: String)
    case logout(refreshToken: String)
    case resetPassword(email: String)
    case verifyPasswordOTP(OTP: String)
    case confirmPasswordReset(password: String, confirmPassword: String, token: String, userId: String)
    case changePassword(oldPassword: String, newPassword: String, confirmNewPassword: String)
    case googleSignIn(authToken: String, frontEnd: String)
    case facebookSignIn(authToken: String)
    //articles
    case getAllArticles
    //contact us
    case contactUs(fullName: String, email: String, subject: String, message: String)
    //user
    case getUser
    case editUser(fullName: String, email: String, address: String, phoneNumber: String)
    case getBestScore
    case getMonumentScore
    case getLandmarkScore
    case getStatueScore
    case putMonumentScore(newScore: Int)
    case putLandmarkScore(newScore: Int)
    case putStatueScore(newScore: Int)
    //favorites
    case getFavorites
    case addArticleToFavs(id: Int)
    case addMonumentToFavs(id: Int)
    case delFavArticle(id: Int)
    case delFavMonument(id: Int)
    case isFavorite(id: Int)
    //Monuments
    case getMonument
    //Questions
    case getLandmarksQuestions
    case getMonumentsQuestions
    case getStatuesQuestions
    //Tours
    case getAllTours
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .register, .verifyEmail, .requestNewOTP, .login, .logout, .refreshToken, .resetPassword, .verifyPasswordOTP, .googleSignIn, .facebookSignIn, .contactUs, .addArticleToFavs, .addMonumentToFavs, .isFavorite:
            return .post
        case .confirmPasswordReset, .editUser:
            return .patch
        case .changePassword, .putStatueScore, .putLandmarkScore, .putMonumentScore:
            return .put
        case .delFavArticle, .delFavMonument:
            return .delete
        default:
            return .get
        }
    }
    
    private var isAuthenticated: Bool {
        switch self {
        case .register, .verifyEmail, .requestNewOTP, .login, .resetPassword, .confirmPasswordReset, .verifyPasswordOTP:
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
        case .getAllArticles:
            return APIEndpoints.getAllArticles
        case .contactUs:
            return APIEndpoints.contactUs
        case .getUser:
            return APIEndpoints.getUser
        case .editUser:
            return APIEndpoints.editUser
        case .getBestScore:
            return APIEndpoints.getBestScore
        case .getMonumentScore:
            return APIEndpoints.getMonumentScore
        case .getLandmarkScore:
            return APIEndpoints.getLandmarkScore
        case .getStatueScore:
            return APIEndpoints.getStatueScore
        case .putMonumentScore:
            return APIEndpoints.putMonumentScore
        case .putLandmarkScore:
            return APIEndpoints.putLandmarkScore
        case .putStatueScore:
            return APIEndpoints.putStatueScore
        case .getFavorites:
            return APIEndpoints.getFavorites
        case .addArticleToFavs:
            return APIEndpoints.addArticleToFavs
        case .addMonumentToFavs:
            return APIEndpoints.addMonumentToFavs
        case .delFavArticle(let id):
            return "\(APIEndpoints.delFavArticle)/\(id)"
        case .delFavMonument:
            return APIEndpoints.delFavMonument
        case .getMonument:
            return APIEndpoints.getMonument
        case .getLandmarksQuestions:
            return APIEndpoints.getLandmarksQuestions
        case .getMonumentsQuestions:
            return APIEndpoints.getMonumentsQuestions
        case .getStatuesQuestions:
            return APIEndpoints.getStatuesQuestions
        case .getAllTours:
            return APIEndpoints.getAllTours
        case .isFavorite(let id):
            return APIEndpoints.isFavorite
            
        }
    }
    
    // MARK: - Parameters
    private var parameters: [String: Any]? {
        switch self {
            // Auth
        case .register(
            fullName: let fullName,
            email: let email,
            password: let password,
            confirmPassword: let confirmPassword,
            address: let address,
            phoneNumber: let phoneNumber
        ):
            return [
                APIParameterKey.email: email,
                APIParameterKey.fullName: fullName,
                APIParameterKey.password: password,
                APIParameterKey.confirmPassword: confirmPassword,
                APIParameterKey.address: address,
                APIParameterKey.phoneNumber: phoneNumber
            ]
        case .verifyEmail(OTP: let OTP):
            return [APIParameterKey.OTP: OTP]
        case .requestNewOTP(email: let email):
            return [APIParameterKey.email: email]
        case .refreshToken(token: let token):
            return [APIParameterKey.token: token]
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
        case .contactUs(fullName: let fullName, email: let email, subject: let subject, message: let message):
            return [
                APIParameterKey.fullName: fullName,
                APIParameterKey.email: email,
                APIParameterKey.subject: subject,
                APIParameterKey.message: message
            ]
        case .editUser(fullName: let fullName, email: let email, address: let address, phoneNumber: let phoneNumber):
            return [
                APIParameterKey.fullName: fullName,
                APIParameterKey.email: email,
                APIParameterKey.address: address,
                APIParameterKey.phoneNumber: phoneNumber
            ]
            //Take another look
        case .putMonumentScore(newScore: let newScore):
            return [APIParameterKey.newScore: String(newScore)]
        case .putLandmarkScore(newScore: let newScore):
            return [APIParameterKey.newScore: String(newScore)]
        case .putStatueScore(newScore: let newScore):
            return [APIParameterKey.newScore: String(newScore)]
        case .addArticleToFavs(let id):
            return[APIParameterKey.id: String(id)]
        case .addMonumentToFavs(id: let id):
            return [APIParameterKey.id: id]
        default:
            return nil
        }
    }
    
    
    private var encoding: ParameterEncoding {
//        switch self {
//        case .addArticleToFavs:
//            return URLEncoding.httpBody
//        default:
//
//        }
        return JSONEncoding.default
        
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try APIEndpoints.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        if !isAuthenticated {
                if let accessToken = TokenManager.shared.getAccessToken() {
                    urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: HTTPHeaderField.authorization.rawValue)
                }
            }
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}
