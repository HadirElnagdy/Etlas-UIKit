//
//  AppCommon.swift
//  Etlas
//
//  Created by Hadir on 02/07/2023.
//

import Foundation
import UIKit
import SwiftMessages

class AppCommon: NSObject {
    
    static let shared = AppCommon()
    

//    func checkConnectivity() -> Bool {
//        if currentReachabilityStatus != .notReachable {
//            return true
//        } else {
//            showSwiftMessage(title: "Error".localized, message: "Please Check Your Internet Connection".localized, theme: .error)
//            return false
//        }
//    }
    
    func alertWithAction(_ Message:String?,Title:String?,BtnOk:String?,Context:AnyObject ,Actions:@escaping ()->Void?){
        let WrongAlert=UIAlertController(title: Title, message: Message, preferredStyle: UIAlertController.Style.alert)
        WrongAlert.addAction(UIAlertAction(title: BtnOk, style: UIAlertAction.Style.default, handler: { Action in
            Actions()
        }))
        Context.present(WrongAlert, animated: true, completion: nil)
    }
    
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPhone(_ value: String) -> Bool {
        let PHONE_REGEX = "^01[0-2]{1}[0-9]{8}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let PHONE_REGEX1 = "^1[0-2]{1}[0-9]{8}"
        let phoneTest1 = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX1)
        return phoneTest.evaluate(with: value) || phoneTest1.evaluate(with: value)
    }
    
    func isValidPassword(_ password: String) -> (state: Bool, message: String) {
        let passwordLength = password.count
        let passwordLengthMessage = "Password should be between 8 and 20 characters."
        let passwordLowercaseMessage = "Password should contain at least one lowercase letter."
        let passwordUppercaseMessage = "Password should contain at least one uppercase letter."
        let passwordNumberMessage = "Password should contain at least one digit."
        let passwordSpecialMessage = "Password should contain at least one special character."
        let passwordSpaceMessage = "Password should not contain any spaces."
        
        if passwordLength < 8 || passwordLength > 20 {
            return (false, passwordLengthMessage)
        }
        
        if password.range(of: "[a-z]", options: .regularExpression) == nil {
            return (false, passwordLowercaseMessage)
        }
        
        if password.range(of: "[A-Z]", options: .regularExpression) == nil {
            return (false, passwordUppercaseMessage)
        }
        
        if password.range(of: "[0-9]", options: .regularExpression) == nil {
            return (false, passwordNumberMessage)
        }
        
        if password.range(of: "[^a-zA-Z\\d]", options: .regularExpression) == nil {
            return (false, passwordSpecialMessage)
        }
        
        if password.range(of: "\\s", options: .regularExpression) != nil {
            return (false, passwordSpaceMessage)
        }
        return (true, "")
    }

}
