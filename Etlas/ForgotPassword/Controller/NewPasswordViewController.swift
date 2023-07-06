//
//  NewPasswordViewController.swift
//  Etlas
//
//  Created by Hadir on 09/05/2023.
//

import UIKit

class NewPasswordViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var showNewPasswordBtn: PasswordButton!
    @IBOutlet weak var showPasswordBtn: PasswordButton!
    @IBOutlet weak var newPasswordTextField: CustomTextField!
    @IBOutlet weak var confirmPasswordTextField: CustomTextField!
    var token, userId: String?
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func finishPressed(_ sender: UIButton) {
        //change password
        //Alert
        APIClient.confirmPasswordReset(password: newPasswordTextField.text ?? "", confirmPassword: confirmPasswordTextField.text ?? "", token: token ?? "", userId: userId ?? ""){[weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(_):
                goToLogin()
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
        
    }
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Private methods
    private func setupUI() {
        newPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
        showNewPasswordBtn.textField = newPasswordTextField
        showPasswordBtn.textField = confirmPasswordTextField
        
    }
    private func goToLogin(){
        let storyborad = UIStoryboard(name: "SignInViewController", bundle: nil)
        let viewController =  storyborad.instantiateViewController(withIdentifier: "SignInViewController")
        self.present(viewController, animated: true)
    }
    
    
}
