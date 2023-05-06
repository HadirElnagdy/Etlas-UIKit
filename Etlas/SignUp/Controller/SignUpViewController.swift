//
//  SignUpViewController.swift
//  Etlas
//
//  Created by Hadir on 10/04/2023.
//

import UIKit

class SignUpViewController: BaseViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var fullNameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var nextButton: BrownButton!

    // MARK: - Lifecycle methods
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }
    
    // MARK: - IBActions
    @IBAction func SignInPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SignInViewController", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        self.show(signInVC, sender: self)
    }
    @IBAction func nextPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToSecondPage", sender: self)
    }
    @IBAction func showPasswordPressed(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        showPasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    // MARK: - Private methods
        private func setupUI() {
            passwordTextField.isSecureTextEntry = true
            fullNameTextField.isSecureTextEntry = false
            emailTextField.isSecureTextEntry = false
//            let attributedString = NSMutableAttributedString(string: "OR SIGN UP USING")
//            let boldFontAttribute = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 18.0)!]
//            attributedString.addAttributes(boldFontAttribute, range: NSRange(location: 3, length: 7))
//            signUpLabel.attributedText = attributedString
//            passwordTextField.placeholder = "Password".localized
//            emailTextField.placeholder = "Email".localized
//            fullNameTextField.placeholder = "Fullname".localized
//            nextButton.setTitle("Next".localized, for: .normal)
        }
        
    
}
