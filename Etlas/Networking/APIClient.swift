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
       // print(route.urlRequest?.)
        AF.request(route).validate(statusCode: 200 ..< 300)
            .responseDecodable { (response: AFDataResponse<T>) in
                switch response.result {
                case .success(let model):
                   // print("\(model)")
                    completion(.success(model))
                    break
                case .failure(let error):
//                    if let responseBody = String(data: response.data ?? Data(), encoding: .utf8) {
//                                        print("Response body: \(responseBody)")
//                                    }
                    debugPrint(error)
//                    print(error)
//                    print(error.localizedDescription)
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
    
    static func register(fullName:String, email: String, password: String, confirmPassword: String, address: String, phoneNumber: String, completion: @escaping (Result<RegisterResponseModel, NetworkError>) -> Void) {
        performRequest(route: APIRouter.register(fullName: fullName, email: email, password: password, confirmPassword: confirmPassword, address: address, phoneNumber: phoneNumber), completion: completion)
    }
    static func verifyEmail(OTP: String, completion: @escaping (Result<successResponse, NetworkError>) -> Void){
        performRequest(route: APIRouter.verifyEmail(OTP: OTP), completion: completion)
    }
    static func requestNewOTP(email: String, completion: @escaping (Result<successResponse, NetworkError>) -> Void){
        performRequest(route: APIRouter.requestNewOTP(email: email), completion: completion)
    }
    static func login(email: String, password: String, completion: @escaping (Result<loginResponseModel, NetworkError>) -> Void){
        performRequest(route: APIRouter.login(email: email, password: password), completion: completion)
    }
    static func logout(refreshToken: String, completion: @escaping (Result<Empty, NetworkError>) -> Void){
        performRequest(route: APIRouter.logout(refreshToken: refreshToken), completion: completion)
    }
    static func refreshToken(token: String, completion: @escaping (Result<Tokens, NetworkError>) -> Void){
        performRequest(route: APIRouter.refreshToken(token: token), completion: completion)
    }
    static func resetPassword(email: String, completion: @escaping (Result<successResponse, NetworkError>) -> Void) {
        performRequest(route: APIRouter.resetPassword(email: email), completion: completion)
    }
    static func verifyPasswordOTP(OTP: String, completion: @escaping (Result<verifyPasswordOTPResponse, NetworkError>) -> Void){
        performRequest(route: APIRouter.verifyPasswordOTP(OTP: OTP), completion: completion)
    }
    static func confirmPasswordReset(password: String, confirmPassword: String, token: String, userId: String, completion: @escaping (Result<ConfirmPasswordResetResponse, NetworkError>) -> Void) {
        performRequest(route: APIRouter.confirmPasswordReset(password: password, confirmPassword: confirmPassword, token: token, userId: userId), completion: completion)
    }
    
    static func changePassword(oldPassword: String, newPassword: String, confirmNewPassword: String, completion: @escaping (Result<successResponse, NetworkError>) -> Void) {
        performRequest(route: APIRouter.changePassword(oldPassword: oldPassword, newPassword: newPassword, confirmNewPassword: confirmNewPassword), completion: completion)
    }
    
    static func googleSignIn(authToken: String, frontEnd: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
        performRequest(route: APIRouter.googleSignIn(authToken: authToken, frontEnd: frontEnd), completion: completion)
    }
    
    static func facebookSignIn(authToken: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
        performRequest(route: APIRouter.facebookSignIn(authToken: authToken), completion: completion)
    }
    static func contactUs(fullName: String, email: String, subject: String, message: String, completion: @escaping (Result<successResponse, NetworkError>) -> Void){
        performRequest(route: APIRouter.contactUs(fullName: fullName, email: email, subject: subject, message: message), completion: completion)
        
    }
    static func getUser(completion: @escaping (Result<User, NetworkError>) -> Void) {
        performRequest(route: APIRouter.getUser, completion: completion)
    }

    static func editUser(fullName: String, email: String, address: String, phoneNumber: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
        performRequest(route: APIRouter.editUser(fullName: fullName, email: email, address: address, phoneNumber: phoneNumber), completion: completion)
    }

    static func getBestScore(completion: @escaping (Result<BestScoreResponse, NetworkError>) -> Void) {
        performRequest(route: APIRouter.getBestScore, completion: completion)
    }

    static func getMonumentScore(completion: @escaping (Result<MonumentsScoreResponse, NetworkError>) -> Void) {
        performRequest(route: APIRouter.getMonumentScore, completion: completion)
    }

    static func getLandmarkScore(completion: @escaping (Result<LandmarksScoreResponse, NetworkError>) -> Void) {
        performRequest(route: APIRouter.getLandmarkScore, completion: completion)
    }

    static func getStatueScore(completion: @escaping (Result<StatuesScoreResponse, NetworkError>) -> Void) {
        performRequest(route: APIRouter.getStatueScore, completion: completion)
    }

    static func putMonumentScore(newScore: Int, completion: @escaping (Result<MonumentsScoreResponse, NetworkError>) -> Void) {
        performRequest(route: APIRouter.putMonumentScore(newScore: newScore), completion: completion)
    }

    static func putLandmarkScore(newScore: Int, completion: @escaping (Result<LandmarksScoreResponse, NetworkError>) -> Void) {
        performRequest(route: APIRouter.putLandmarkScore(newScore: newScore), completion: completion)
    }

    static func putStatueScore(newScore: Int, completion: @escaping (Result<StatuesScoreResponse, NetworkError>) -> Void) {
        performRequest(route: APIRouter.putStatueScore(newScore: newScore), completion: completion)
    }
    static func getAllArticles(completion: @escaping (Result<AllArticlesResponse, NetworkError>) -> Void) {
        performRequest(route: APIRouter.getAllArticles, completion: completion)
    }
    static func getAllTours(completion: @escaping (Result<AllToursResponse, NetworkError>) -> Void) {
            performRequest(route: APIRouter.getAllTours, completion: completion)
        }
    static func getMonument(completion: @escaping (Result<MonumentResult, NetworkError>) -> Void) {
        performRequest(route: APIRouter.getMonument, completion: completion)
    }

    static func getFavorites(completion: @escaping (Result<FavoritesResponse, NetworkError>) -> Void) {
        performRequest(route: APIRouter.getFavorites, completion: completion)
    }

    static func addArticleToFavs(id: Int, completion: @escaping (Result<FavoritesResult, NetworkError>) -> Void) {
        performRequest(route: APIRouter.addArticleToFavs(id: id), completion: completion)
    }

    static func addMonumentToFavs(id: Int, completion: @escaping (Result<FavoritesResult, NetworkError>) -> Void) {
        performRequest(route: APIRouter.addMonumentToFavs(id: id), completion: completion)
    }

    static func delFavArticle(id: Int, completion: @escaping (Result<Empty, NetworkError>) -> Void) {
        performRequest(route: APIRouter.delFavArticle(id: id), completion: completion)
    }

    static func delFavMonument(id: Int, completion: @escaping (Result<Empty, NetworkError>) -> Void) {
        performRequest(route: APIRouter.delFavMonument(id: id), completion: completion)
    }
    
    static func isFavorite(id: Int, completion: @escaping (Result<IsFavoriteResponse, NetworkError>) -> Void) {
        performRequest(route: APIRouter.isFavorite(id: id), completion: completion)
    }

    static func getLandmarksQuestions(completion: @escaping (Result<[QuestionResponse], NetworkError>) -> Void) {
        performRequest(route: APIRouter.getLandmarksQuestions, completion: completion)
    }

    static func getMonumentsQuestions(completion: @escaping (Result<[QuestionResponse], NetworkError>) -> Void) {
        performRequest(route: APIRouter.getMonumentsQuestions, completion: completion)
    }

    static func getStatuesQuestions(completion: @escaping (Result<[QuestionResponse], NetworkError>) -> Void) {
        performRequest(route: APIRouter.getStatuesQuestions, completion: completion)
    }

    
}
