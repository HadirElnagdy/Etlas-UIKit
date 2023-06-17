//
//  AboutUsViewController.swift
//  Etlas
//
//  Created by Hadir on 03/05/2023.
//

import UIKit

class AboutUsViewController: UIViewController {
   
    // MARK: - IBOutlets
   

   
   // MARK: - Lifecycle methods
   override func viewDidLoad() {
       super.viewDidLoad()
       setupUI()
   }
   
   // MARK: - IBActions
    @IBAction func closePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    


   
   // MARK: - Private methods
   private func setupUI() {
       
   }



}
