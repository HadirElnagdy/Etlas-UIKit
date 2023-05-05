//
//  BrownButton.swift
//  Etlas
//
//  Created by Hadir on 03/05/2023.
//

import UIKit
class ClearButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        styleButton()
    }
    
    
    func styleButton() {
        backgroundColor = .clear
        layer.cornerRadius = 20
        layer.borderWidth = 2
        let customColor = UIColor(red: 0.75, green: 0.51, blue: 0.28, alpha: 1.0)
        layer.borderColor = customColor.cgColor
        let buttonFont = UIFont(name: "Montserrat-Bold", size: 20)
        titleLabel?.font = buttonFont
        setTitleColor(.white, for: .normal)
        
    }
    
    
}
