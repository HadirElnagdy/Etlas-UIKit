//
//  ViewController.swift
//  Etlas
//
//  Created by Hadir on 17/03/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Check if language selection is needed
        let selectedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage")
        if selectedLanguage == nil {
           // Show language selection page
            let storyborad = UIStoryboard(name: "LanguageSelectionViewController", bundle: nil)
            let languageSelectionVC =  storyborad.instantiateViewController(withIdentifier: "LanguageSelectionViewController")
            self.navigationController?.pushViewController(languageSelectionVC, animated: false)
        } else {
            let storyborad = UIStoryboard(name: "OnboardingViewController", bundle: nil)
            let onboardingVC =  storyborad.instantiateViewController(withIdentifier: "OnboardingViewController")
            self.navigationController?.pushViewController(onboardingVC, animated: false)
        }

        
    }

 
    
}

