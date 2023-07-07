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
    @IBOutlet weak var bestScoreLabel: UILabel!
    
   
   // MARK: - Lifecycle methods
   override func viewDidLoad() {
       super.viewDidLoad()
       setupUI()
   }
   
   // MARK: - IBActions
    @IBAction func closePressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func playNowPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "KnowledgeGameViewController", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "KnowledgeGameViewController")
        navigationController?.pushViewController(VC, animated: true)
    }
    


   
   // MARK: - Private methods
   private func setupUI() {
       bestScoreView.layer.cornerRadius = 30
       self.navigationController?.navigationBar.isHidden = true
       APIClient.getBestScore(){[weak self] result in
           switch result {
           case .success(let model):
               self?.bestScoreLabel.text = String(model.totalBestScore ?? 0)
               break
           case .failure(let error):
               return print(error.localizedDescription)
           }
           
       }

   }



}
