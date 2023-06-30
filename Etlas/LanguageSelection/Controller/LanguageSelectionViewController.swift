//
//  LanguageSelectionViewController.swift
//  Etlas
//
//  Created by Hadir on 15/06/2023.
//

import UIKit

class LanguageSelectionViewController: UIViewController {

    // MARK: - IBOutlets
    
    
   
   // MARK: - Lifecycle methods
   override func viewDidLoad() {
       super.viewDidLoad()
       setupUI()
   }
   
   // MARK: - IBActions
    @IBAction func backPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
  
    
   
   // MARK: - Private methods
   private func setupUI() {
       
   }
   

}
