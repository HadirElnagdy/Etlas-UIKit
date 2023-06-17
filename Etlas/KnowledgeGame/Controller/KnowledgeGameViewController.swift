//
//  KnowledgeGameViewController.swift
//  Etlas
//
//  Created by Hadir on 06/05/2023.
//

import UIKit

class KnowledgeGameViewController: UIViewController {

  
    // MARK: - IBOutlets
    @IBOutlet weak var statuesView: CustomView!
    @IBOutlet weak var monumentsView: CustomView!
    @IBOutlet weak var landmarksView: CustomView!
    

   
   // MARK: - Lifecycle methods
   override func viewDidLoad() {
       super.viewDidLoad()
       setupUI()
   }
   
   // MARK: - IBActions
   


   
   // MARK: - Private methods
   private func setupUI() {
       self.navigationController?.navigationBar.isHidden = true
       let statuesTapGesture = UITapGestureRecognizer(target: self, action: #selector(statuesViewTapped))
         statuesView.addGestureRecognizer(statuesTapGesture)

         let monumentsTapGesture = UITapGestureRecognizer(target: self, action: #selector(monumentsViewTapped))
         monumentsView.addGestureRecognizer(monumentsTapGesture)

         let landmarksTapGesture = UITapGestureRecognizer(target: self, action: #selector(landmarksViewTapped))
         landmarksView.addGestureRecognizer(landmarksTapGesture)

   }

    @objc func statuesViewTapped() {
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "HomeViewController")
        self.present(VC, animated: true)
    }

    @objc func monumentsViewTapped() {
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "HomeViewController")
        self.present(VC, animated: true)
    }

    @objc func landmarksViewTapped() {
        let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "HomeViewController")
        self.present(VC, animated: true)
    }


}
