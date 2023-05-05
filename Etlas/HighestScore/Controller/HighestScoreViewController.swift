//
//  HighestScoreViewController.swift
//  Etlas
//
//  Created by Hadir on 03/05/2023.
//

import UIKit

class HighestScoreViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var bestScoreView: UIView!

   
   // MARK: - Lifecycle methods
   override func viewDidLoad() {
       super.viewDidLoad()
       setupUI()
   }
   
   // MARK: - IBActions
   


   
   // MARK: - Private methods
   private func setupUI() {
       bestScoreView.layer.cornerRadius = 30
       self.navigationController?.navigationBar.isHidden = true

   }



}
