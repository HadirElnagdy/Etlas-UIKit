//
//  SignUpViewController.swift
//  Etlas
//
//  Created by Hadir on 10/04/2023.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true

    }
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!{
        didSet{
            let customColor = UIColor(red: 0.75, green: 0.51, blue: 0.28, alpha: 1.0)
            nextButton.backgroundColor = customColor
            nextButton.layer.cornerRadius = 20
            nextButton.layer.borderWidth = 2
            nextButton.layer.borderColor = customColor.cgColor
        }
    }
    
    @IBAction func SignInPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SignInViewController", bundle: nil)
        let signUpVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        self.show(signUpVC, sender: self)
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
    }
    @IBAction func showPasswordPressed(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
}
