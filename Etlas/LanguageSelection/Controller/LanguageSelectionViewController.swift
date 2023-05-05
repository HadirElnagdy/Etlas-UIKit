//
//  LanguageSelectionViewController.swift
//  Etlas
//
//  Created by Hadir on 30/03/2023.
//

import UIKit

class LanguageSelectionViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var continueButton: BrownButton!
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func continuePressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "OnboardingViewController", bundle: nil)
        let onboardingVC = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController")
        self.show(onboardingVC, sender: self)
        
    }
    
    // MARK: - Private methods
    private func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
}


