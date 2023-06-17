//
//  SettingsViewController.swift
//  Etlas
//
//  Created by Hadir on 06/05/2023.
//

import UIKit

class SettingsViewController: UIViewController {

    
      // MARK: - IBOutlets
      

     
     // MARK: - Lifecycle methods
     override func viewDidLoad() {
         super.viewDidLoad()
         setupUI()
     }
     
     // MARK: - IBActions
    @IBAction func learnMorePressed(_ sender: UIButton) {
    }
    @IBAction func logOutPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "OnboardingViewController", bundle: nil)
        let onboardingVC = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController")
        self.present(onboardingVC, animated: true)
    }
    @IBAction func editProfilePressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "EditAccountViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "EditAccountViewController")
        self.present(viewController, animated: true)
    }
    @IBAction func favouritesPressed(_ sender: UIButton) {
        
    }
    @IBAction func bestScorePressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "HighestScoreViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "HighestScoreViewController")
        self.present(viewController, animated: true)
    }
    @IBAction func languagePressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "LanguageSelectionViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "LanguageSelectionViewController")
        self.present(viewController, animated: true)
    }
    

     
     // MARK: - Private methods
     private func setupUI() {
         self.navigationController?.navigationBar.isHidden = true

     }


}
