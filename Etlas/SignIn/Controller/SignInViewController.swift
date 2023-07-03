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
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var showPasswordButton: PasswordButton!
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
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ForgotPasswordViewController", bundle: nil)
        let forgotPWVC = storyboard.instantiateViewController(withIdentifier: "ForgotPasswordViewController")
    
        self.present(forgotPWVC, animated: true)
        
    }
    @IBAction func googleSignInPressed(_ sender: UIButton) {
    }
    @IBAction func facebookSignInPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func signInPressed(_ sender: UIButton) {
        APIClient.login(email: emailTextField.text ?? "", password: passwordTextField.text ?? ""){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let user):
               // UserDefaults.standard.set(user, forKey: "user")
                SharedData.shared.SetIsLoggedIn(true)
                goToHome()
            case .failure(let error):
                // showSwiftMessage(title: "error", message: error.message)
                return
            }
        }
        

    }
    @IBAction func signUpPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SignUpViewController", bundle: nil)
        let signUpVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        self.present(signUpVC, animated: true)

    }
    
    // MARK: - Private methods
    private func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        let attributedString = NSMutableAttributedString(string: "OR SIGN IN USING")
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 18.0)!]
        attributedString.addAttributes(boldFontAttribute, range: NSRange(location: 3, length: 7))
        signInLabel.attributedText = attributedString
        passwordTextField.isSecureTextEntry = true
        showPasswordButton.textField = passwordTextField
       
    }
    private func goToHome() {
        let storyborad = UIStoryboard(name: "HomeViewController", bundle: nil)
        let homeVC =  storyborad.instantiateViewController(withIdentifier: "MainTabBarViewController")
        self.present(homeVC, animated: true)
    }
    
    
}
