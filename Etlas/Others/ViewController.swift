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
        let storyborad = UIStoryboard(name: "LanguageSelectionViewController", bundle: nil)
        let onboardingVC =  storyborad.instantiateViewController(withIdentifier: "LanguageSelectionViewController")
        self.navigationController?.pushViewController(onboardingVC, animated: false)
    }

    @IBOutlet weak var continueButton: UIButton!{
        didSet{
            let customColor = UIColor(red: 0.75, green: 0.51, blue: 0.28, alpha: 1.0)
            continueButton.backgroundColor = customColor
            continueButton.layer.cornerRadius = 20
            continueButton.layer.borderWidth = 2
            continueButton.layer.borderColor = customColor.cgColor
        }
    }
    
    @IBAction func continuePressed(_ sender: UIButton) {
        
    }
    
}

