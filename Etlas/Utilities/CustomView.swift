//
//  CustomView.swift
//  Etlas
//
//  Created by Hadir on 08/05/2023.
//

import UIKit

class CustomView: UIView {

    required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setupView()
       }
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           setupView()
       }
       
       private func setupView() {
           self.layer.cornerRadius = 20
           self.layer.masksToBounds = true
       }

}
