//
//  SharedData.swift
//  Etlas
//
//  Created by Hadir on 29/06/2023.
//


import Foundation

class SharedData {
    
    public static let shared = SharedData()
    let defaults = UserDefaults.standard
    let isLoggedInKey = "isLoggedIn"
    let isLoggedOutKey = "isLoggedOut"
    let isActiveKey = "isActive"
    let languageKey = "language"
    let IsAppAlreadyLaunchedOnceKey = "IsAppAlreadyLaunchedOnce"
    let UserDataKey = "UserData"
    
    private init() { }
    
    func SetIsLoggedIn(_ isLoggedIn: Bool) {
        defaults.set(isLoggedIn, forKey: isLoggedInKey)
    }
    
    func isLoggedIn() -> Bool {
        if (UserDefaults.standard.object(forKey: isLoggedInKey) != nil) {
            return defaults.bool(forKey: isLoggedInKey)
        }else{
            return false
        }
    }
    
    func SetIsLoggedOut(_ isLoggedOut: Bool){
        defaults.set(isLoggedOut, forKey: isLoggedOutKey)
    }
    
    func GetIsLogedout() -> Bool{
        if (UserDefaults.standard.object(forKey: isLoggedOutKey) != nil) {
            return defaults.bool(forKey: isLoggedOutKey)
        }
        return false
    }
    
    func SetIsActive(_ isActive: Bool) {
        defaults.set(isActive, forKey: isActiveKey)
    }
    
    func GetIsActive() -> Bool {
        if (UserDefaults.standard.object(forKey: isActiveKey) != nil) {
            return defaults.bool(forKey: isActiveKey)
        }
        return false
    }
    
    func SetIsAppAlreadyLaunchedOnce(_ isAppAlreadyLaunchedOnce: Bool){
        defaults.set(isAppAlreadyLaunchedOnce, forKey: IsAppAlreadyLaunchedOnceKey)
    }
    
    func isAppAlreadyLaunchedOnce() -> Bool {
        if (UserDefaults.standard.object(forKey: IsAppAlreadyLaunchedOnceKey) != nil) {
            return defaults.bool(forKey: IsAppAlreadyLaunchedOnceKey)
        }else{
            return false
        }
    }
    
    func SetUserData(_ data: Data) {
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: UserDataKey)
    }
}


