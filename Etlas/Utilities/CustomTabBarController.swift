//
//  CustomTabBarController.swift
//  Etlas
//
//  Created by Hadir on 05/05/2023.
//

import UIKit
class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    let customTabBarView = UIView()
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self

        // Create custom tab bar view
        customTabBarView.frame = tabBar.frame
        customTabBarView.backgroundColor = .white
        view.addSubview(customTabBarView)

        // Hide default tab bar
        tabBar.isHidden = true

        // Add buttons to custom tab bar view
        button1.setTitle("Tab 1", for: .normal)
        button1.addTarget(self, action: #selector(selectTab1), for: .touchUpInside)
        customTabBarView.addSubview(button1)

        button2.setTitle("Tab 2", for: .normal)
        button2.addTarget(self, action: #selector(selectTab2), for: .touchUpInside)
        customTabBarView.addSubview(button2)

        button3.setTitle("Tab 3", for: .normal)
        button3.addTarget(self, action: #selector(selectTab3), for: .touchUpInside)
        customTabBarView.addSubview(button3)

        // Set initial selected index
        selectedIndex = 0
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // Position buttons in custom tab bar view
        let buttonWidth = customTabBarView.frame.width / CGFloat(customTabBarView.subviews.count)
        for (index, button) in customTabBarView.subviews.enumerated() {
            button.frame = CGRect(x: buttonWidth * CGFloat(index), y: 0, width: buttonWidth, height: customTabBarView.frame.height)
        }
    }

    @objc func selectTab1() {
        selectedIndex = 0
    }

    @objc func selectTab2() {
        selectedIndex = 1
    }

    @objc func selectTab3() {
        selectedIndex = 2
    }
}
