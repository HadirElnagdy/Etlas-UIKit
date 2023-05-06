//
//  CustomGrayView.swift
//  Etlas
//
//  Created by Hadir on 06/05/2023.
//

import UIKit

class CustomGrayView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }

}
