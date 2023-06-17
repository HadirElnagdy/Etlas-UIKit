//
//  CustomTabBarVC.swift
//  TabBarDemo
//
//  Created by Hadir on 07/05/2023.
//

import UIKit

class TBMiddleButtonVCViewController: UITabBarController, UITabBarControllerDelegate{
    
    var tabBarHeight: CGFloat = 80

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.selectedIndex = 0
        let customColor = UIColor(red: 0, green: 52/255, blue: 65/255, alpha: 1.0)
        tabBar.tintColor = customColor
        tabBar.unselectedItemTintColor = customColor
        // Assuming you have a UITabBarItem instance called 'myTabBarItem'
        

        setupMiddleButton()
        // Find the UITabBar view in the view hierarchy
        let tabBar = self.tabBar
        // Get the UITabBarButton subviews
        let tabBarButtons = tabBar.subviews.compactMap { $0 as? UIControl }

        // Add vertical lines between each pair of buttons
        for i in 0..<tabBarButtons.count - 1 {
            if i == 0 || i == 3 {
            let verticalLine = UIView()
            verticalLine.backgroundColor = UIColor(red: 0, green: 0.2, blue: 0.2549, alpha: 0.5)
            tabBar.insertSubview(verticalLine, at: 1)
            verticalLine.translatesAutoresizingMaskIntoConstraints = false
            verticalLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
            verticalLine.heightAnchor.constraint(equalTo: tabBarButtons[i].heightAnchor, multiplier: 0.5).isActive = true
            verticalLine.centerXAnchor.constraint(equalTo: tabBarButtons[i].trailingAnchor).isActive = true
            verticalLine.centerYAnchor.constraint(equalTo: tabBarButtons[i].centerYAnchor).isActive = true
        }
            
        }

    }
    
    func setupMiddleButton() {
        let middleButtonWidth: CGFloat = 65
        let middleButtonHeight: CGFloat = 65
        
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - (middleButtonWidth / 2), y: -(middleButtonHeight*0.4), width: middleButtonWidth, height: middleButtonHeight))
        
        middleButton.setBackgroundImage(UIImage(named: "ic_ScanButton"), for: .normal)
        middleButton.layer.cornerRadius = 20
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.1
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.tabBar.addSubview(middleButton)
        middleButton.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        
        
        self.view.layoutIfNeeded()
    }
    
    @objc func openCamera(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
}


extension TBMiddleButtonVCViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        // guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
        //     return
        // }
    }
}

