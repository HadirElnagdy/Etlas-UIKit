//
//  EOTPViewController.swift
//  Etlas
//
//  Created by Hadir on 23/06/2023.
//

import UIKit

class EOTPViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var textField1: CustomTextField!
    @IBOutlet weak var textField2: CustomTextField!
    @IBOutlet weak var textField3: CustomTextField!
    @IBOutlet weak var textField4: CustomTextField!
    var enteredEmail: String?
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField1.becomeFirstResponder()
    }
    
    // MARK: - IBActions
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    struct VerifyOTPRequestModel: Codable {
        let email: String
    }

    struct VerifyOTPResponse: Codable {
        let success: String
    }

    struct OTPVerifyRequestModel: Codable {
        let otp: String
        let email: String
    }
    
    struct OTPVerifyResponse: Codable {
        let success: String
    }

    @IBAction func nextPressed(_ sender: BrownButton) {
        //singleton pattern
        
        let otpCode = [textField1.text, textField2.text, textField3.text, textField4.text]
            .compactMap { $0 }
            .reduce("", +)
        
        guard let enteredEmail else { return }
        
        BackendService.shared.perform(url: APIEndpoints.requestVerifyOTP,
                                      model: OTPVerifyRequestModel(otp: otpCode, email: enteredEmail),
                                      responseType: OTPVerifyResponse.self,
                                      method: .post,
                                      completionHandler: { verifyOTPResponse in
            print(verifyOTPResponse)
            let storyborad = UIStoryboard(name: "HomeViewController", bundle: nil)
            let vc =  storyborad.instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarViewController

            self.present(vc, animated: true)
        })
    }
    
    @IBAction func onResendMailPressed(_ sender: UIButton) {
        guard let enteredEmail else { return }
        BackendService.shared.perform(url: APIEndpoints.requestVerifyOTP,
                                      model: VerifyOTPRequestModel(email: enteredEmail),
                                      responseType: VerifyOTPResponse.self,
                                      method: .post,
                                      completionHandler: { verifyOTPResponse in
            print(verifyOTPResponse)
        })

    }
    
    
    // MARK: - Private methods
    private func setupUI() {
        let otpTextFields = [textField1, textField2, textField3, textField4]
        
        for otpTextField in otpTextFields {
            otpTextField?.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
            otpTextField?.textAlignment = .center
            otpTextField?.font = UIFont(name: "Montserrat-SemiBold", size: 31)
        }
    }
    
    @objc private func textDidChange(_ textField: UITextField) {
        switch textField {
        case textField1:
            textField2.becomeFirstResponder()
        case textField2:
            textField3.becomeFirstResponder()
        case textField3:
            textField4.becomeFirstResponder()
        case textField4:
            textField4.resignFirstResponder()
        default:
            break
        }
    }
}


