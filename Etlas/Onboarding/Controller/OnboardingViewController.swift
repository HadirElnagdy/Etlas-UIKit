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
        let signInVC = storyboard.instantiateInitialViewController() as! SignInViewController
        self.present(signInVC, animated: true)
        //navigationController?.pushViewController(signInVC, animated: true)
    }
    @IBAction func signUpPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SignUpViewController", bundle: nil)
        let signUpVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        // Push the view controller onto the navigation stack
        self.present(signUpVC, animated: true)
        //navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    // MARK: - Private methods
    private func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        if self.navigationController == nil {
            print("Navigation controller is nil. Check if the view controller is embedded in a navigation controller.")
        } else {
            print("Navigation controller is not nil.")
        }

//        signInButton.setTitle("Sign_In".localized, for: .normal)
//        signUpButton.setTitle("Sign_Up".localized, for: .normal)
        }
}
