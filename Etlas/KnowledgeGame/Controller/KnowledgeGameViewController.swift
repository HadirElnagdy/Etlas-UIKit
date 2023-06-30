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
    @IBOutlet weak var statuesScoreLabel: UILabel!
    @IBOutlet weak var monumentsScoreLabel: UILabel!
    @IBOutlet weak var landmarksScoreLabel: UILabel!
    
    
    
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
        let statuesTapGesture = UITapGestureRecognizer(target: self, action: #selector(statuesViewTapped))
        statuesView.addGestureRecognizer(statuesTapGesture)
        
        let monumentsTapGesture = UITapGestureRecognizer(target: self, action: #selector(monumentsViewTapped))
        monumentsView.addGestureRecognizer(monumentsTapGesture)
        
        let landmarksTapGesture = UITapGestureRecognizer(target: self, action: #selector(landmarksViewTapped))
        landmarksView.addGestureRecognizer(landmarksTapGesture)
        
    }
    private func pushStoryboardViewController(identifier: String) {
        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: identifier)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func statuesViewTapped() {
        pushStoryboardViewController(identifier: "QuestionsViewController")
    }
    
    @objc func monumentsViewTapped() {
        pushStoryboardViewController(identifier: "QuestionsViewController")
    }
    
    @objc func landmarksViewTapped() {
        pushStoryboardViewController(identifier: "RecognitionFailedViewController")
    }
    
    
}
