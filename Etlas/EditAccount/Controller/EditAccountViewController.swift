//
//  EditAccountViewController.swift
//  Etlas
//
//  Created by Hadir on 03/05/2023.
//

import UIKit

class EditAccountViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var fullNameTextField: BlueTextField!
    @IBOutlet weak var emailTextField: BlueTextField!
    @IBOutlet weak var passwordTextField: BlueTextField!
    @IBOutlet weak var phoneTextField: BlueTextField!
    @IBOutlet weak var addressTextField: BlueTextField!
    @IBOutlet weak var editFullNameButton: UIButton!
    @IBOutlet weak var editEmailButton: UIButton!
    @IBOutlet weak var editPasswordButton: UIButton!
    @IBOutlet weak var editPhoneButton: UIButton!
    @IBOutlet weak var editAddressButton: UIButton!
    
    //checkmark
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func closePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func editFullNamePressed(_ sender: UIButton) {
        toggleEditMode(for: fullNameTextField, button: sender)
    }
    @IBAction func editEmailPressed(_ sender: UIButton) {
        toggleEditMode(for: emailTextField, button: sender)
    }
    @IBAction func editPasswordPressed(_ sender: UIButton) {
        toggleEditMode(for: passwordTextField, button: sender)
    }
    @IBAction func editPhonePressed(_ sender: UIButton) {
        toggleEditMode(for: phoneTextField, button: sender)
    }
    @IBAction func editAddressPressed(_ sender: UIButton) {
        toggleEditMode(for: addressTextField, button: sender)
    }
    @IBAction func savePressed(_ sender: UIButton) {
    }
    
    
    
    
    // MARK: - Private methods
    private func setupUI() {
        self.navigationController?.navigationBar.isHidden = true

    }
    private func toggleEditMode(for textField: BlueTextField, button: UIButton) {
        textField.isEnabled = !textField.isEnabled
        let iconImage = textField.isEnabled ? UIImage(systemName: "checkmark") : UIImage(systemName: "pencil")
        button.setImage(iconImage, for: .normal)
        if textField.isEnabled {
            textField.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
    }

    
    
}
