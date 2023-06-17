//
//  CircleImageView.swift
//  Etlas
//
//  Created by Hadir on 06/05/2023.
//

import UIKit

class CircleImageView: UIImageView {
    
    // MARK: - Properties
    
    private let grayTintColor = UIColor.darkGray.withAlphaComponent(1.0)
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        // Make the image view circular
        layer.cornerRadius = bounds.width / 2
        clipsToBounds = true
        
        // Set the gray tint color and add a tap gesture recognizer
        //image = UIImage(named: "img_GizaTour")?.withRenderingMode(.alwaysTemplate)
        isUserInteractionEnabled = true
//        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapImageView)))
    }
    
    // MARK: - Actions
//
//    @objc private func didTapImageView() {
//        // Open the image in full screen when the user taps on it
//        guard let image = image else { return }
//        let viewController = UIViewController()
//        let imageView = UIImageView(image: image)
//        imageView.contentMode = .scaleAspectFit
//        viewController.view = imageView
//        viewController.modalPresentationStyle = .fullScreen
//
//    }
}

