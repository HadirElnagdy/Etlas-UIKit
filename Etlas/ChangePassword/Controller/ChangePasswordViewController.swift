//
//  ChangePasswordViewController.swift
//  Etlas
//
//  Created by Hadir on 27/06/2023.
//

import UIKit

class ChangePasswordViewController: BaseViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var showOldPasswordBtn: PasswordButton!
    @IBOutlet weak var showNewPasswordBtn: PasswordButton!
    @IBOutlet weak var showPasswordBtn: PasswordButton!
    @IBOutlet weak var oldPasswordTextField: CustomTextField!
    @IBOutlet weak var newPasswordTextField: CustomTextField!
    @IBOutlet weak var confirmPasswordTextField: CustomTextField!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func savePressed(_ sender: UIButton) {
        //change password
        //Alert
        
    }
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Private methods
    private func setupUI() {
        oldPasswordTextField.isSecureTextEntry = true
        newPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
        showOldPasswordBtn.textField = oldPasswordTextField
        showNewPasswordBtn.textField = newPasswordTextField
        showPasswordBtn.textField = confirmPasswordTextField
        
    }
    

}
