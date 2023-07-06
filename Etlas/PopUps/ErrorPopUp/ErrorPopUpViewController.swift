//
//  ErrorPopUpViewController.swift
//  Etlas
//
//  Created by Hadir on 05/07/2023.
//

import UIKit

class ErrorPopUpViewController: UIViewController {

    
    // MARK: - IBOutlets
    @IBOutlet weak var messageLabel: UILabel!
    var errorMessage: String?
   // MARK: - Lifecycle methods
   override func viewDidLoad() {
       super.viewDidLoad()
       setupUI()
       messageLabel.text = errorMessage
   }
   
   // MARK: - IBActions
   


   
   // MARK: - Private methods
   private func setupUI() {
      
   }



}
