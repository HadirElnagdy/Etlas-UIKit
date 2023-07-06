//
//  EOTPViewController.swift
//  Etlas
//
//  Created by Hadir on 23/06/2023.
//

import UIKit
import SwiftMessages

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
    
    
    @IBAction func nextPressed(_ sender: BrownButton) {
        let otpCode = [textField1.text, textField2.text, textField3.text, textField4.text]
            .compactMap { $0 }
            .reduce("", +)
        APIClient.verifyEmail(OTP: otpCode){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(_):
                goToLogin()
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
        
    }
    @IBAction func onResendMailPressed(_ sender: UIButton) {
        APIClient.requestNewOTP(email: enteredEmail ?? ""){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(_):
                print("OTPSent")
                //show a message otp sent succesfuly
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
        
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
    
    private func goToLogin(){
        let storyborad = UIStoryboard(name: "SignInViewController", bundle: nil)
        let viewController =  storyborad.instantiateViewController(withIdentifier: "SignInViewController")
        self.present(viewController, animated: true)
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


