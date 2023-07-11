//
//  SignUpSecondViewController.swift
//  Etlas
//
//  Created by Hadir on 25/04/2023.
//

import UIKit
import SwiftMessages

class SignUpSecondViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var registerButton: BrownButton!
    @IBOutlet weak var phoneTextField: CustomTextField!
    @IBOutlet weak var addressTextField: CustomTextField!
    
    var fullName: String? = "", email: String? = "", password: String = ""
    

    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func goBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func googleSignUpPressed(_ sender: UIButton) {
    }
    @IBAction func facebookSignUpPressed(_ sender: UIButton) {
    }
    @IBAction func registerPressed(_ sender: UIButton) {
        APIClient.register(fullName: fullName ?? "" , email: email ?? "", password: password, confirmPassword: password, address: addressTextField.text ?? "", phoneNumber: phoneTextField.text ?? "") { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(_):
                goToVerification()
            case .failure(let error):
                let alertController = UIAlertController(title: "Opps!", message: error.localizedDescription, preferredStyle: .alert)
                present(alertController, animated: true, completion: nil)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    alertController.dismiss(animated: true, completion: nil)
                }
                print(error.localizedDescription)
                
                return
            }
        }
        
    }

    @IBAction func signInPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SignInViewController", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        self.present(signInVC, animated: true)

    }
    
    // MARK: - Private methods
    private func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        let attributedString = NSMutableAttributedString(string: "OR SIGN UP USING")
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 18.0)!]
        attributedString.addAttributes(boldFontAttribute, range: NSRange(location: 3, length: 7))
        signUpLabel.attributedText = attributedString
        
    }
    private func goToVerification() {
        let storyborad = UIStoryboard(name: "EmailVerificationViewController", bundle: nil)
        let vc =  storyborad.instantiateViewController(withIdentifier: "EOTPViewController") as! EOTPViewController
        vc.enteredEmail = email
        self.present(vc, animated: true)
    }
    
}

