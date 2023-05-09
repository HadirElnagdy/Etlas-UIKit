//
//  CustomTabBar.swift
//  Etlas
//
//  Created by Hadir on 08/05/2023.
//

import UIKit

class CustomTabBar: UITabBar {

    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        self.addShape()
        self.tintColor = UIColor(red: 0, green: 0.202, blue: 0.254, alpha: 1)
        self.barTintColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        self.unselectedItemTintColor = UIColor(red: 0.64, green: 0.64, blue: 0.64, alpha: 1.0)
        
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor
        shapeLayer.lineWidth = 1.0
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath {
        let height: CGFloat = 80
        let tabBarWidth = self.superview?.frame.width ?? UIScreen.main.bounds.width // Use the width of the superview or the screen as fallback
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: self.frame.height - height, width: tabBarWidth, height: height), byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20, height: 20))
        path.close()
        return path.cgPath
    }
}
