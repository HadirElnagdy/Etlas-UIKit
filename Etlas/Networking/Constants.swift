//
//  APIEndpoints.swift
//  Etlas
//
//  Created by Hadir on 30/06/2023.
//

import Foundation

class APIEndpoints {
    
    static let baseURL = "https://api.etlas.tech/"
    static let baseImgURL = "https://etlas-storage.s3.us-east-005.backblazeb2.com/media/articles_images/"
    var accessToken = TokenManager.shared.getAccessToken()
    
    //auth
    static var register: String {
        return "auth/register/"
    }
    static var verifyEmail: String {
        return "auth/email-verify/"
    }
    static var requestNewOTP: String {
        return "auth/request-verify-otp/"
    }
    static var refreshToken: String {
            return "auth/token/refresh/"
    }
    static var login: String {
        return "auth/login/"
    }
    static var logout: String {
            return "auth/logout/"
    }
    static var resetPassword: String {
        return "auth/request-password-reset/"
    }
    static var confirmPasswordReset: String {
        return "auth/password-reset-complete/"
    }
    static var verifyPasswordOTP: String {
        return "auth/password-reset-otp/"
    }
    static var changePassword: String {
        return "users/change-password/"
    }
    
    //social auth
    static var googleSignIn: String {
        return "social-auth/google/"
    }
    static var facebookSignIn: String {
        return "social-auth/facebook/"
    }
    
    //articles
    static var getAllArticles: String {
        return "articles/"
    }
   
    
    //contact us
    static var contactUs: String {
        return "contact-us/message/"
    }
    
    //users
    static var getUser: String {
        return "users/"
    }
    static var editUser: String {
        return "users/"
    }
    static var getBestScore: String {
        return "users/total-best-score/"
    }
    static var getMonumentScore: String {
        return "users/best-score-monuments/"
    }
    static var getLandmarkScore: String {
        return "users/best-score-landmarks/"
    }
    static var getStatueScore: String {
        return "users/best-score-statues/"
    }
    static var putMonumentScore: String {
        return "users/best-score-monuments/"
    }
    static var putLandmarkScore: String {
        return "users/best-score-landmarks/"
    }
    static var putStatueScore: String {
        return "users/best-score-statues/"
    }
    static var editUserImg: String {
        return "users/profile-image/"
    }
    
    //favorites
    static var getFavorites: String {
        return "favorites/"
    }
    static var addArticleToFavs: String {
        return "favorites/article/add/"
    }
    static var addMonumentToFavs: String {
        return "favorites/monument/add/"
    }
    static var delFavArticle: String {
        return "favorites/article/delete/"
    }
    static var delFavMonument: String {
        return "favorites/monument/delete/"
    }
    
    //monuments
    static var getMonument: String {
        return "monuments/"
    }
    static var detectMonument: String {
        return "monuments/detect/"
    }
    
    //questions
    static var getLandmarksQuestions: String {
        return "questions/landmarks/"
    }
    static var getMonumentsQuestions: String {
        return "questions/monuments/"
    }
    static var getStatuesQuestions: String {
        return "questions/statues/"
    }
    
    //tours
    static var getAllTours: String {
        return "/tours/"
    }
    
}
struct APIParameterKey {
    static let email = "email"
    static let password = "password"
    static let id = "id"
    static let fullName = "full_name"
    static let confirmPassword = "confirm_password"
    static let phoneNumber = "phone_number"
    static let imgURL = "image_url"
    static let refreshToken = "refresh"
    static let accessToken = "access"
    static let subject = "subject"
    static let message = "message"
    static let threeDModel = "three_d_model"
    static let date = "date"
    static let description = "description"
    static let address = "address"
    static let confirmNewPassword = "confirm_new_password"
    static let OTP = "otp"
    static let userId = "uidb64"
    static let token = "token"
    static let newPassword = "new_password"
    static let oldPassword = "old_password"
    static let authToken = "auth_token"
    static let frontEnd = "front_end"
    static let newScore = "new_score"
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case acceptType = "accept"
    case acceptEncoding = "Accept-Encoding"
    case authorization = "Authorization"
}

enum ContentType: String {
    case json = "application/json"
}

