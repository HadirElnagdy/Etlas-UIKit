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
   
    var score = "0"
    
   // MARK: - Lifecycle methods
   override func viewDidLoad() {
       super.viewDidLoad()
       setupUI()
       currentScoreLabel.text = "\(score)"
   }
   
   // MARK: - IBActions
    
    @IBAction func closePressed(_ sender: UIButton) {
        if let viewControllers = navigationController?.viewControllers {
            guard viewControllers.count >= 3 else {
                return
            }
            let targetViewController = viewControllers[viewControllers.count - 3]
            navigationController?.popToViewController(targetViewController, animated: true)
        }
        
    }
    
    @IBAction func playNowPressed(_ sender: UIButton) {
        if let viewControllers = navigationController?.viewControllers {
            guard viewControllers.count >= 3 else {
                return
            }
            let targetViewController = viewControllers[viewControllers.count - 3]
            navigationController?.popToViewController(targetViewController, animated: true)
        }
        
    }
        
    
   
   // MARK: - Private methods
   private func setupUI() {
       bestScoreView.layer.cornerRadius = 30
       self.navigationController?.navigationBar.isHidden = true

   }


}
