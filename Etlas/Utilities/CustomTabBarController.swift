//
//  CustomTabBarController.swift
//  Etlas
//
//  Created by Hadir on 07/05/2023.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var tabBarHeight: CGFloat = 80
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.tabBar.itemPositioning = .centered
        self.selectedIndex = 0
        setupMiddleButton()
    }

    func setupMiddleButton() {
        let middleButtonWidth: CGFloat = 60
        let middleButtonHeight: CGFloat = 60
        
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - (middleButtonWidth / 2), y: -(middleButtonHeight / 3), width: middleButtonWidth, height: middleButtonHeight))
        
        middleButton.setBackgroundImage(UIImage(named: "ic_ScanButton"), for: .normal)
        middleButton.layer.cornerRadius = 20
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.1
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.tabBar.addSubview(middleButton)
        middleButton.addTarget(self, action: #selector(selectMiddleVC), for: .touchUpInside)
        
       
        self.view.layoutIfNeeded()
    }

    @objc func selectMiddleVC(sender: UIButton) {
        self.selectedIndex = 2
    }
    
}
