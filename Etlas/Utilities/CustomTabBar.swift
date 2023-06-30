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
        self.barTintColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 70
        
        if hasNotch() {
            // Add an inset to the bottom of the tab bar
            sizeThatFits.height += 8
        }
        
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
        let height: CGFloat = 80
        
        var rect = CGRect(x: 0, y: 0, width: frame.width, height: height)
        
        if hasNotch() {
            // Adjust the height to account for the inset on devices with a notch
            rect.size.height += 8
        }
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20.0, height: 20.0))
        return path.cgPath
    }
    
    func hasNotch() -> Bool {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows[0]
            return window.safeAreaInsets.bottom > 0
        }
        return false
    }
}
