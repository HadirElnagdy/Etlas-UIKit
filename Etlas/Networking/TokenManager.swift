//
//  TokenManager.swift
//  Etlas
//
//  Created by Hadir on 04/07/2023.
//


import Foundation
//import KeychainSwift

class TokenManager {
    static let shared = TokenManager()
    
    private var accessToken: String?
    private var refreshToken: String?
    private var refreshTimer: Timer?
    
    private init() {
        self.accessToken = UserDefaults.standard.string(forKey: "accessToken")
        self.refreshToken = UserDefaults.standard.string(forKey: "refreshToken")
        startRefreshTimer()
    }
    
    func setTokens(accessToken: String?, refreshToken: String?) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        UserDefaults.standard.set(accessToken, forKey: "accessToken")
        UserDefaults.standard.set(refreshToken, forKey: "refreshToken")
        startRefreshTimer()
    }
    
    func getAccessToken() -> String? {
        return accessToken
    }
    
    
    func getRefreshToken() -> String? {
        return refreshToken
    }
    
    
    private func startRefreshTimer() {
        refreshTimer?.invalidate()
        refreshTimer = Timer.scheduledTimer(withTimeInterval: 4 * 60, repeats: true) { [weak self] _ in
            self?.refreshAccessToken()
        }
    }
    
    func refreshAccessToken() {
        guard let refreshToken = refreshToken else {
            return print("there's no refresh token")
        }
        APIClient.refreshToken(token: refreshToken){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let tokens):
                setTokens(accessToken: tokens.access,
                          refreshToken: tokens.refresh)
                print("refreshing")
            case .failure(let error):
                return print(error.localizedDescription)
            }
        }
        
    }
    func clearTokens() {
        self.accessToken = nil
        self.refreshToken = nil
        UserDefaults.standard.removeObject(forKey: "accessToken")
        UserDefaults.standard.removeObject(forKey: "refreshToken")
        refreshTimer?.invalidate()
    }

   
}
