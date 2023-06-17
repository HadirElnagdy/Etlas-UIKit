//
//  ForgotPasswordViewController.swift
//  Etlas
//
//  Created by Hadir on 09/05/2023.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {
    
    
    // MARK: - IBOutlets
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    // MARK: - Private methods
    private func setupUI() {
        
        
    }
    
    
    
    
    
}
