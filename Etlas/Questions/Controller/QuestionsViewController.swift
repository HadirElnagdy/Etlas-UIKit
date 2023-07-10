//
//  QuestionsViewController.swift
//  Etlas
//
//  Created by Hadir on 18/06/2023.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var questionImage: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var hintButton: UIButton!
    @IBOutlet weak var labelBorderView: UIView!
    @IBOutlet var choiceButtons: [UIButton]!
    
    
    var questions: [QuestionResponse]?
    var currentQuestionIndex: Int = 0
    var score: Int = 0
    var hintsLeft = 2
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showCurrentQuestion()
        
    }
    
    // MARK: - IBActions
    @IBAction func backPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func hintPressed(_ sender: UIButton) {
        if hintsLeft > 0 {
            hintsLeft -= 1
            self.hintButton.imageView?.image = UIImage(named: "ic_hint\(hintsLeft)")
            guard let currentQuestion = questions?[currentQuestionIndex] else {
                   return
               }
               
               var wrongChoicesCount = 0
            let customColor = UIColor(red: 37/255, green: 86/255, blue: 108/255, alpha: 0.5)
               for (_, choiceButton) in choiceButtons.enumerated() {
                   guard let shuffledChoices = currentQuestion.shuffledChoices else {
                       return
                   }
                   if choiceButton.titleLabel?.text != currentQuestion.correctChoice && wrongChoicesCount < 2 {
                       choiceButton.backgroundColor = customColor
                       choiceButton.isEnabled = false
                       wrongChoicesCount += 1
                   }
               }
        }
        
    }
    
    @IBAction func choiceButtonsTapped(_ sender: BrownButton) {
        if let selectedChoiceIndex = choiceButtons.firstIndex(of: sender) {
            handleChoiceSelected(choiceIndex: selectedChoiceIndex)
        }
    }
    
    
    // MARK: - Private methods
    private func setupUI() {
        self.labelBorderView.setupBorder()
        self.hintButton.imageView?.image = UIImage(named: "ic_hint2")
    }
    
    private func showCurrentQuestion() {
        guard let currentQuestion = questions?[currentQuestionIndex] else {
            return
        }
        if let imageURLString = currentQuestion.imageURL, let imageURL = URL(string: imageURLString) {
            URLSession.shared.dataTask(with: imageURL) { [weak self] (data, _, error) in
                if let error = error {
                    print("Error downloading image: \(error.localizedDescription)")
                    return
                }
                
                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.questionImage.image = image
                    }
                }
            }.resume()
        }
        
        questionLabel.text = currentQuestion.statement
        scoreLabel.text = "\(score)/\(questions?.count)"
        if let shuffledChoices = currentQuestion.shuffledChoices {
            for (index, choiceButton) in choiceButtons.enumerated() {
                if index < shuffledChoices.count {
                    choiceButton.setTitle(shuffledChoices[index].choiceText, for: .normal)
                    choiceButton.isHidden = false
                } else {
                    choiceButton.isHidden = true
                }
            }
        }
    }
    
    private func handleChoiceSelected(choiceIndex: Int) {
        guard let currentQuestion = questions?[currentQuestionIndex] else {
            return
        }
        
        let selectedChoice = currentQuestion.shuffledChoices?[choiceIndex]
        if selectedChoice?.choiceText == currentQuestion.correctChoice && currentQuestionIndex < (questions?.count ?? 1) - 1 {
            score += 1
            currentQuestionIndex += 1
            showCurrentQuestion()
            choiceButtons[choiceIndex].backgroundColor = .green
        } else {
            if selectedChoice?.choiceText == currentQuestion.correctChoice {
                choiceButtons[choiceIndex].backgroundColor = .red
            }
            if currentQuestion.label == "landmark"{
                APIClient.putLandmarkScore(newScore: score){[weak self](result) in
                    switch result {
                    case .success(_):
                        break
                    case .failure(let error):
                        return print(error.localizedDescription)
                    }
                }
            }else if currentQuestion.label == "monument"{
                APIClient.putMonumentScore(newScore: score){[weak self](result) in
                    switch result {
                    case .success(_):
                        break
                    case .failure(let error):
                        return print(error.localizedDescription)
                    }
                }
            }else {
                APIClient.putStatueScore(newScore: score){[weak self](result) in
                    switch result {
                    case .success(_):
                        break
                    case .failure(let error):
                        return print(error.localizedDescription)
                    }
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.navigateToCurrentScoreViewController()
            }
        }
        
        for button in choiceButtons {
            button.isUserInteractionEnabled = false
        }
        let customColor = UIColor(red: 0.75, green: 0.51, blue: 0.28, alpha: 1.0)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            for button in self.choiceButtons {
                button.backgroundColor = customColor
                button.isUserInteractionEnabled = true
            }
        }
    }
    
    
    private func navigateToCurrentScoreViewController() {
        let storyboard = UIStoryboard(name: "CurrentScoreViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "CurrentScoreViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
