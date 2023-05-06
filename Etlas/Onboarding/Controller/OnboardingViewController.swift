//
//  OnboardingViewController.swift
//  Etlas
//
//  Created by Hadir on 10/04/2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var signInButton: BrownButton!
    @IBOutlet weak var signUpButton: ClearButton!
    
    
    // MARK: - Lifecycle methods
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }
    
    // MARK: - IBActions
    @IBAction func signInPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SignInViewController", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        self.show(signInVC, sender: self)
    }
    @IBAction func signUpPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SignUpViewController", bundle: nil)
        let signUpVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        self.show(signUpVC, sender: self)
    }
    
    // MARK: - Private methods
    private func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
//        signInButton.setTitle("Sign_In".localized, for: .normal)
//        signUpButton.setTitle("Sign_Up".localized, for: .normal)
        }
}
