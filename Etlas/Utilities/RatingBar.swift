//
//  RatingBar.swift
//  Etlas
//
//  Created by Hadir on 06/05/2023.
//

import UIKit

class RatingBar: UIView {
    
    private var starButtons = [UIButton]()
    private let starCount = 5
    private var rating: Int = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        for _ in 0..<starCount {
            let starButton = UIButton()
            starButton.setImage(UIImage(systemName: "star"), for: .normal)
            starButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
            starButton.tag = starButtons.count
            starButton.addTarget(self, action: #selector(starButtonTapped(_:)), for: .touchUpInside)
            starButton.translatesAutoresizingMaskIntoConstraints = false
            addSubview(starButton)
            starButtons.append(starButton)
        }
        
        NSLayoutConstraint.activate([
            starButtons[0].leadingAnchor.constraint(equalTo: leadingAnchor),
            starButtons[0].topAnchor.constraint(equalTo: topAnchor),
            starButtons[0].bottomAnchor.constraint(equalTo: bottomAnchor),
            starButtons[0].widthAnchor.constraint(equalToConstant: frame.width / CGFloat(starCount))
        ])
        
        for i in 1..<starCount {
            NSLayoutConstraint.activate([
                starButtons[i].leadingAnchor.constraint(equalTo: starButtons[i - 1].trailingAnchor),
                starButtons[i].topAnchor.constraint(equalTo: topAnchor),
                starButtons[i].bottomAnchor.constraint(equalTo: bottomAnchor),
                starButtons[i].widthAnchor.constraint(equalToConstant: frame.width / CGFloat(starCount))
            ])
        }
        
        backgroundColor = .lightGray
        layer.cornerRadius = 10
    }
    
    private func updateButtonSelectionStates() {
        for (index, starButton) in starButtons.enumerated() {
            starButton.isSelected = index < rating
        }
    }
    
    @objc private func starButtonTapped(_ sender: UIButton) {
        rating = sender.tag + 1
    }
    
}
