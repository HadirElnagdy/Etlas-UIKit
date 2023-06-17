//
//  HomeViewController.swift
//  Etlas
//
//  Created by Hadir on 03/05/2023.
//

import UIKit
import Cosmos
import TinyConstraints

class HomeViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var ratingView: UIView!
    
   
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
    
   
   // MARK: - Private methods
   private func setupUI() {
       self.navigationController?.navigationBar.isHidden = true
       
       
   }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //the search when someone press go or return
    
         return true
    }

    


}
