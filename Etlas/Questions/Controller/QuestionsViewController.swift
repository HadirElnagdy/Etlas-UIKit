//
//  QuestionsViewController.swift
//  Etlas
//
//  Created by Hadir on 18/06/2023.
//

import UIKit

class QuestionsViewController: UIViewController {

    // MARK: - IBOutlets
   
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var hintButton: UIButton!
    @IBOutlet weak var labelBorderView: UIView!
    
   // MARK: - Lifecycle methods
   override func viewDidLoad() {
       super.viewDidLoad()
       setupUI()
   }

   // MARK: - IBActions
    @IBAction func backPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func hintPressed(_ sender: UIButton) {
    }
   
   // MARK: - Private methods
   private func setupUI() {
       self.labelBorderView.setupBorder()
   }

}
