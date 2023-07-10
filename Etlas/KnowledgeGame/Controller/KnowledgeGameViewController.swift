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
        let statuesTapGesture = UITapGestureRecognizer(target: self, action: #selector(statuesViewTapped))
        statuesView.addGestureRecognizer(statuesTapGesture)
        
        let monumentsTapGesture = UITapGestureRecognizer(target: self, action: #selector(monumentsViewTapped))
        monumentsView.addGestureRecognizer(monumentsTapGesture)
        
        let landmarksTapGesture = UITapGestureRecognizer(target: self, action: #selector(landmarksViewTapped))
        landmarksView.addGestureRecognizer(landmarksTapGesture)
        
        APIClient.getStatueScore{[weak self] (result) in
            switch result {
            case .success(let model):
                self?.statuesScoreLabel.text = model.bestScoreStatues
                break
            case .failure(let error):
                return print(error.localizedDescription)
            }
        }
        APIClient.getMonumentScore{[weak self] (result) in
            switch result {
            case .success(let model):
                self?.monumentsScoreLabel.text = model.bestScoreMonuments
                break
            case .failure(let error):
                return print(error.localizedDescription)
            }
        }
        APIClient.getLandmarkScore{[weak self] (result) in
            switch result {
            case .success(let model):
                self?.landmarksScoreLabel.text = model.bestScoreLandmarks
                break
            case .failure(let error):
                return print(error.localizedDescription)
            }
        }
        
    }
    private func pushStoryboardViewController(identifier: String) {
        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: identifier)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func statuesViewTapped() {
        APIClient.getStatuesQuestions { [weak self] result in
            switch result {
            case .success(let response):
                let questions = response
                let storyboard = UIStoryboard(name: "QuestionsViewController", bundle: nil)
                if let viewController = storyboard.instantiateViewController(identifier: "QuestionsViewController") as? QuestionsViewController {
                    viewController.questions = questions
                    self?.navigationController?.pushViewController(viewController, animated: true)
                }
                break
            case .failure(let error):
                print("\n\nKnowledge Game Problem")
                print("-------------------")
                debugPrint(error)
                print("\n \(error)")
                return
            }
        }
    }

    
    @objc func monumentsViewTapped() {
        APIClient.getMonumentsQuestions { [weak self] result in
            switch result {
            case .success(let response):
                let questions = response
                let storyboard = UIStoryboard(name: "QuestionsViewController", bundle: nil)
                if let viewController = storyboard.instantiateViewController(identifier: "QuestionsViewController") as? QuestionsViewController {
                    viewController.questions = questions
                    self?.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
       
    }
    
    @objc func landmarksViewTapped() {
        APIClient.getLandmarksQuestions { [weak self] result in
            switch result {
            case .success(let response):
                let questions = response
                let storyboard = UIStoryboard(name: "QuestionsViewController", bundle: nil)
                if let viewController = storyboard.instantiateViewController(identifier: "QuestionsViewController") as? QuestionsViewController {
                    viewController.questions = questions
                    self?.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
