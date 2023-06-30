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
    @IBOutlet weak var phoneTextField: CustomTextField!
    @IBOutlet weak var addressTextField: CustomTextField!
    
    var name: String?
//    vc.name = nameTextfiled.text
    
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
        BackendService.shared.perform(url: APIEndpoints.register,
                                      model: RegisterRequestModel(email: "alm3223me111@gmail.com",
                                                                  password: "qwaszx1@Q",
                                                                  fullName: "Mostafa ESsam",
                                                                  confirmPassword: "qwaszx1@Q",
                                                                  address: addressTextField.text ?? "-1",
                                                                  phoneNumber: phoneTextField.text ?? "-1"),
                                      responseType: RegisterResponse.self,
                                      method: .post,
                                      completionHandler: { response in
            print(response)
            
            let storyborad = UIStoryboard(name: "EmailVerificationViewController", bundle: nil)
            let vc =  storyborad.instantiateViewController(withIdentifier: "EmailVerificationViewController") as? EmailVerificationViewController
            vc?.name = "we got this name from the previous screen"
            
            self.present(vc, animated: true)
        })
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
    
}

