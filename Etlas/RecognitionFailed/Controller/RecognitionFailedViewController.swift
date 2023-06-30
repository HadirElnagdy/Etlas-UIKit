//
//  RecognitionFailedViewController.swift
//  Etlas
//
//  Created by Hadir on 15/06/2023.
//

import UIKit

class RecognitionFailedViewController: UIViewController {

    // MARK: - IBOutlets
    
    
   
   // MARK: - Lifecycle methods
   override func viewDidLoad() {
       super.viewDidLoad()
       setupUI()
   }
   
   // MARK: - IBActions
    @IBAction func learnMorePressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "MainMenuViewController", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "MainMenuViewController")
        self.present(VC, animated: true)
        
    }
    @IBAction func tryAgainPressed(_ sender: BrownButton) {
        
    }
    
    
   
   // MARK: - Private methods
   private func setupUI() {
       
       
   }

}
