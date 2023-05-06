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
        let storyborad = UIStoryboard(name: "OnboardingViewController", bundle: nil)
        let onboardingVC =  storyborad.instantiateViewController(withIdentifier: "OnboardingViewController")
        self.navigationController?.pushViewController(onboardingVC, animated: false)
        
        
    }
    
    
    
}

