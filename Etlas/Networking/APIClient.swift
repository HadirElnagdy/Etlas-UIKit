//
//  APIClient.swift
//  Etlas
//
//  Created by Hadir on 01/07/2023.
//

import Alamofire
import Foundation
import NVActivityIndicatorView

class APIClient {
    private static func performRequest<T: Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, NetworkError>) -> Void) {
       // print(route.urlRequest?.httpBody)
        AF.request(route).validate(statusCode: 200 ..< 300)
            .responseDecodable { (response: AFDataResponse<T>) in
                switch response.result {
                case .success(let model):
                    print("\(model)")
                    completion(.success(model))
                    break
                case .failure(let error):
                    debugPrint(error)
                    print(error)
                    print(error.localizedDescription)
                    do {
                        guard let data = response.data else {
                            completion(.failure(.other))
                            return
                        }
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        if let message = (json as? [String: Any])?["Message"] as? String {
                            completion(.failure(.networkError(message: message)))
                        } else {
                            completion(.failure(.networkError(message: error.localizedDescription)))
                        }
                    } catch {
                        completion(.failure(.networkError(message: error.localizedDescription)))
                    }
                    break
                }
            }
    }
    
    static func register(fullName:String, email: String, password: String, address: String, phoneNumber: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
        performRequest(route: APIRouter.register(fullName: fullName, email: email, password: password, address: address, phoneNumber: phoneNumber), completion: completion)
    }
    static func verifyEmail(OTP: String, completion: @escaping (Result<User, NetworkError>) -> Void){
        performRequest(route: APIRouter.verifyEmail(OTP: OTP), completion: completion)
    }
    static func requestNewOTP(email: String, completion: @escaping (Result<User, NetworkError>) -> Void){
        performRequest(route: APIRouter.requestNewOTP(email: email), completion: completion)
    }
    static func login(email: String, password: String, completion: @escaping (Result<User, NetworkError>) -> Void){
        performRequest(route: APIRouter.login(email: email, password: password), completion: completion)
    }
    static func logout(refreshToken: String, completion: @escaping (Result<User, NetworkError>) -> Void){
        performRequest(route: APIRouter.logout(refreshToken: refreshToken), completion: completion)
    }
    static func refreshToken(token: String, completion: @escaping (Result<User, NetworkError>) -> Void){
        performRequest(route: APIRouter.refreshToken(token: token), completion: completion)
    }
    static func resetPassword(email: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
        performRequest(route: APIRouter.resetPassword(email: email), completion: completion)
    }
    
    static func confirmPasswordReset(password: String, confirmPassword: String, token: String, userId: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
        performRequest(route: APIRouter.confirmPasswordReset(password: password, confirmPassword: confirmPassword, token: token, userId: userId), completion: completion)
    }
    
    static func verifyPasswordOTP(OTP: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
        performRequest(route: APIRouter.verifyPasswordOTP(OTP: OTP), completion: completion)
    }
    
    static func changePassword(oldPassword: String, newPassword: String, confirmNewPassword: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
        performRequest(route: APIRouter.changePassword(oldPassword: oldPassword, newPassword: newPassword, confirmNewPassword: confirmNewPassword), completion: completion)
    }
    
    static func googleSignIn(authToken: String, frontEnd: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
        performRequest(route: APIRouter.googleSignIn(authToken: authToken, frontEnd: frontEnd), completion: completion)
    }
    
    static func facebookSignIn(authToken: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
        performRequest(route: APIRouter.facebookSignIn(authToken: authToken), completion: completion)
    }
//    static func getAllArticles(completion: @escaping (Result<Articles, NetworkError>) -> Void) {
//
//    }
}
