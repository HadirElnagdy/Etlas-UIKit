//
//  BlueButton.swift
//  Etlas
//
//  Created by Hadir on 03/05/2023.
//

import UIKit

class BlueButton: UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        styleButton()
    }
    
    
    func styleButton() {
        let customColor = UIColor(red: 0/255, green: 52/255, blue: 65/255, alpha: 1.0)
        backgroundColor = customColor
        layer.cornerRadius = 20
        layer.borderWidth = 2
        layer.borderColor = customColor.cgColor
        let buttonFont = UIFont(name: "Montserrat-Bold", size: 20)
        titleLabel?.font = buttonFont
        setTitleColor(.white, for: .normal)
    }
}
