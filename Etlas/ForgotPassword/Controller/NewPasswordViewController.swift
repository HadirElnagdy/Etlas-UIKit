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
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func finishPressed(_ sender: UIButton) {
        //change password
        //Alert
        if let signInViewController = navigationController?.viewControllers.first(where: { $0 is SignInViewController }) {
            navigationController?.popToViewController(signInViewController, animated: true)
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
    
    
}
