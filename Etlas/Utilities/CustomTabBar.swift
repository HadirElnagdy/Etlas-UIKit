//
//  CustomTabBar.swift
//  Etlas
//
//  Created by Hadir on 08/05/2023.
//

import UIKit

class CustomTabBar: UITabBar {
    
    private var shapeLayer: CALayer?
    // Set the tint color for the selected and unselected bar items
        
    override func draw(_ rect: CGRect) {
        self.addShape()
        self.barTintColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 70
        return sizeThatFits
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1).cgColor
        shapeLayer.lineWidth = 1.0
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath {
        let height: CGFloat = 70
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: frame.width, height: height), byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20.0, height: 20.0))
        return path.cgPath
    }
    
}
