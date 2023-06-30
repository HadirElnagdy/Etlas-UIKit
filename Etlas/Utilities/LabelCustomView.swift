//
//  LabelCustomView.swift
//  Etlas
//
//  Created by Hadir on 24/06/2023.
//

import UIKit

extension UIView {
    func setupBorder() {
        self.layer.masksToBounds = true
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 20
    }
    
}
