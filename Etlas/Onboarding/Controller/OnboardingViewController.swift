//
//  OnboardingViewController.swift
//  Etlas
//
//  Created by Hadir on 10/04/2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBOutlet weak var signInButton: UIButton!{
        didSet{
            let customColor = UIColor(red: 0.75, green: 0.51, blue: 0.28, alpha: 1.0)
            signInButton.backgroundColor = customColor
            signInButton.layer.cornerRadius = 20
            signInButton.layer.borderWidth = 2
            signInButton.layer.borderColor = customColor.cgColor
            let buttonFont = UIFont(name: "Montserrat-Bold", size: 20)
            signInButton.titleLabel?.font = buttonFont
            signInButton.setTitleColor(.white, for: .normal)
            signInButton.setTitle("Sign In", for: .normal)
        }
    }
    
    @IBOutlet weak var signUpButton: UIButton!{
        didSet{
            signUpButton.backgroundColor = .clear
            signUpButton.layer.cornerRadius = 20
            signUpButton.layer.borderWidth = 2
            let customColor = UIColor(red: 0.75, green: 0.51, blue: 0.28, alpha: 1.0)
            signUpButton.layer.borderColor = customColor.cgColor
            let buttonFont = UIFont(name: "Montserrat-Bold", size: 20)
            signUpButton.titleLabel?.font = buttonFont
            signUpButton.setTitleColor(.white, for: .normal)
            signUpButton.setTitle("Sign Up", for: .normal)
        }
    }
    
    
    
    @IBAction func signInPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SignInViewController", bundle: nil)
        let signUpVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        self.show(signUpVC, sender: self)
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SignUpViewController", bundle: nil)
        let signUpVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        self.show(signUpVC, sender: self)
    }
    
}
