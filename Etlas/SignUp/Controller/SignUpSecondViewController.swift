//
//  SignUpSecondViewController.swift
//  Etlas
//
//  Created by Hadir on 25/04/2023.
//

import UIKit

class SignUpSecondViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var registerButton: BrownButton!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    // MARK: - IBActions
    @IBAction func goBackPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func registerPressed(_ sender: UIButton) {
        
    }
    @IBAction func signInPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SignInViewController", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        self.show(signInVC, sender: self)
    }
    
    // MARK: - Private methods
    private func setupUI() {
//        let attributedString = NSMutableAttributedString(string: "OR SIGN UP USING")
//        let boldFontAttribute = [NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 18.0)!]
//        attributedString.addAttributes(boldFontAttribute, range: NSRange(location: 3, length: 7))
//        signUpLabel.attributedText = attributedString
        
    }
    
}

