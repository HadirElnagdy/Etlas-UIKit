//
//  EmailVerificationViewController.swift
//  Etlas
//
//  Created by Hadir on 23/06/2023.
//

import UIKit

class EmailVerificationViewController: UIViewController {

    var name: String?
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
