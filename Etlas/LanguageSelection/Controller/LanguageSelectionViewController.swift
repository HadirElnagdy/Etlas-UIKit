//
//  LanguageSelectionViewController.swift
//  Etlas
//
//  Created by Hadir on 30/03/2023.
//

import UIKit

class LanguageSelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var continueButton: UIButton!{
        didSet{
            let customColor = UIColor(red: 0.75, green: 0.51, blue: 0.28, alpha: 1.0)
            continueButton.backgroundColor = customColor
            continueButton.layer.cornerRadius = 20
            continueButton.layer.borderWidth = 2
            continueButton.layer.borderColor = customColor.cgColor
            let buttonFont = UIFont(name: "Montserrat-Bold", size: 20)
            continueButton.titleLabel?.font = buttonFont
            continueButton.setTitleColor(.white, for: .normal)
            continueButton.setTitle("Continue", for: .normal)
        }
    }
    
    @IBAction func continuePressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "OnboardingViewController", bundle: nil)
        let signUpVC = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController")
        self.show(signUpVC, sender: self)
        
    }
    
}


