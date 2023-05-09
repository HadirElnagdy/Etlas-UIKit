//  SignInViewController.swift
//  Etlas
//
//  Created by Hadir on 10/04/2023.

import UIKit

class SignInViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var logInLabel: UILabel!
    @IBOutlet weak var EnterAccountLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emaiTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var signInButton: BrownButton!
    @IBOutlet weak var dontHaveAccountLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func showPasswordPressed(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye" : "eye.slash"
        showPasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
    }
    @IBAction func googleSignInPressed(_ sender: UIButton) {
    }
    @IBAction func twitterSignInPressed(_ sender: UIButton) {
    }
    @IBAction func facebookSignInPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func signInPressed(_ sender: UIButton) {
                let storyboard: UIStoryboard = UIStoryboard(name: "HomeViewController", bundle: nil)
                let signUpVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
                self.present(signUpVC, animated: true)
    }
    @IBAction func SignUpPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SignUpViewController", bundle: nil)
        let signUpVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        self.show(signUpVC, sender: self)
    }
    
    // MARK: - Private methods
    private func setupUI() {
        //           let attributedString = NSMutableAttributedString(string: "OR SIGN IN USING")
        //           let boldFontAttribute = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 18.0)!]
        //           attributedString.addAttributes(boldFontAttribute, range: NSRange(location: 3, length: 7))
        //           signInLabel.attributedText = attributedString
        passwordTextField.isSecureTextEntry = true
        //           logInLabel.text = "Log_In".localized
        //           EnterAccountLabel.text = "Enter_Account".localized
        //           emailLabel.text = "Email".localized
        //           emaiTextField.placeholder = "Email".localized
        //           passwordLabel.text = "Password".localized
        //           passwordTextField.placeholder = "Password".localized
        //           forgotPasswordButton.setTitle("Forgot_Password".localized, for: .normal)
        //           signInLabel.text = "OR_SIGNIN_USING".localized
        //           signInButton.setTitle("Sign_In".localized, for: .normal)
        //           dontHaveAccountLabel.text = "Dont_Have_Account"
        //           signUpButton.setTitle("Sign_Up".localized, for: .normal)
    }
    
    
    
    
    
}
