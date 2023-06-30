//
//  CurrentScoreViewController.swift
//  Etlas
//
//  Created by Hadir on 23/06/2023.
//

import UIKit

class CurrentScoreViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var bestScoreView: UIView!
    @IBOutlet weak var currentScoreLabel: UILabel!
   
   // MARK: - Lifecycle methods
   override func viewDidLoad() {
       super.viewDidLoad()
       setupUI()
   }
   
   // MARK: - IBActions
    @IBAction func closePressed(_ sender: UIButton) {
        //go back to KnowledgeGameViewController
    }
    @IBAction func playNowPressed(_ sender: UIButton) {
        //go back to KnowledgeGameViewController
    }
    


   
   // MARK: - Private methods
   private func setupUI() {
       bestScoreView.layer.cornerRadius = 30
       self.navigationController?.navigationBar.isHidden = true

   }


}
