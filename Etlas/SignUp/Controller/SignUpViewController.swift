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
    @IBOutlet weak var showPasswordButton: PasswordButton!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var nextButton: BrownButton!

    // MARK: - Lifecycle methods
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }
    
    // MARK: - IBActions
    @IBAction func googleSignUpPressed(_ sender: UIButton) {
    }
    @IBAction func facebookSignUpPressed(_ sender: UIButton) {
    }
    
    @IBAction func SignInPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SignInViewController", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        self.present(signInVC, animated: true)

    }
    @IBAction func nextPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToSecondPage", sender: self)
    }
   
    
    // MARK: - Private methods
        private func setupUI() {
            self.navigationController?.navigationBar.isHidden = true
            passwordTextField.isSecureTextEntry = true
            let attributedString = NSMutableAttributedString(string: "OR SIGN UP USING")
            let boldFontAttribute = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 18.0)!]
            attributedString.addAttributes(boldFontAttribute, range: NSRange(location: 3, length: 7))
            signUpLabel.attributedText = attributedString
            showPasswordButton.textField = passwordTextField
            
        }
        
    
}
