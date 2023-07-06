//
//  ForgotPasswordViewController.swift
//  Etlas
//
//  Created by Hadir on 09/05/2023.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: CustomTextField!
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextPressed(_ sender: BrownButton) {
        APIClient.resetPassword(email: emailTextField.text ?? " "){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(_):
                self.performSegue(withIdentifier: "goToOtp", sender: self)
            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
        
    }
    
    
    
    // MARK: - Private methods
    private func setupUI() {
        
        
    }
    
    
    
    
    
}
