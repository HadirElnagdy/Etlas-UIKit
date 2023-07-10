//
//  CustomTabBarVC.swift
//  TabBarDemo
//
//  Created by Hadir on 07/05/2023.
//

import UIKit


class TBMiddleButtonVCViewController: UITabBarController, UITabBarControllerDelegate {
    
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
        
        setupMiddleButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Adjust the tab bar item insets if the tab bar has a notch
        if let customTabBar = tabBar as? CustomTabBar {
            if customTabBar.hasNotch() {
                let itemInset: CGFloat = 6
                
                // Adjust the top insets for each tab bar item
                for case let item in tabBar.items ?? [] {
                    item.imageInsets = UIEdgeInsets(top: itemInset, left: 0, bottom: -itemInset, right: 0)
                    item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -itemInset)
                }
                
                // Adjust the vertical lines between tab bar buttons
                let tabBarButtons = tabBar.subviews.compactMap { $0 as? UIControl }
                for i in 0..<tabBarButtons.count - 1 {
                    if i == 1 || i == 4 {
                        let verticalLine = UIView()
                        verticalLine.backgroundColor = UIColor(red: 0, green: 52/255, blue: 65/255, alpha: 0.5)
                        tabBar.insertSubview(verticalLine, at: 1)
                        verticalLine.translatesAutoresizingMaskIntoConstraints = false
                        verticalLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
                        verticalLine.heightAnchor.constraint(equalTo: tabBarButtons[i].heightAnchor, multiplier: 0.5).isActive = true
                        verticalLine.centerXAnchor.constraint(equalTo: tabBarButtons[i].trailingAnchor).isActive = true
                        verticalLine.centerYAnchor.constraint(equalTo: tabBarButtons[i].centerYAnchor).isActive = true
                    }
                }
            }
            else {
                // Get the UITabBarButton subviews
                let tabBarButtons = tabBar.subviews.compactMap { $0 as? UIControl }
                
                // Add vertical lines between each pair of buttons
                for i in 0..<tabBarButtons.count - 1 {
                    if i == 0 || i == 3 {
                        let verticalLine = UIView()
                        verticalLine.backgroundColor = UIColor(red: 0, green: 52/255, blue: 65/255, alpha: 0.5)
                        tabBar.insertSubview(verticalLine, at: 1)
                        verticalLine.translatesAutoresizingMaskIntoConstraints = false
                        verticalLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
                        verticalLine.heightAnchor.constraint(equalTo: tabBarButtons[i].heightAnchor, multiplier: 0.5).isActive = true
                        verticalLine.centerXAnchor.constraint(equalTo: tabBarButtons[i].trailingAnchor).isActive = true
                        verticalLine.centerYAnchor.constraint(equalTo: tabBarButtons[i].centerYAnchor).isActive = true
                    }
                    
                }
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
//        let cameraViewController = CameraViewController()
//        present(cameraViewController, animated: true, completion: nil)
    }
}


extension TBMiddleButtonVCViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
         guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
             return
         }
        if SharedData.shared.flag == 1 {
            SharedData.shared.flag += 1
            let storyboard = UIStoryboard(name: "StatueViewController", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "StatueViewController")
            navigationController?.pushViewController(vc, animated: true)
            
        }else{
            let storyboard = UIStoryboard(name: "RecognitionFailedViewController", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "RecognitionFailedViewController")
            navigationController?.pushViewController(vc, animated: true)
        }
//        let imageData = image.jpegData(compressionQuality: 0.8)
//        let completion: (DetectionResponse?, NetworkError?) -> Void = { result, error in
//            if let result = result {
//                print("Result: \(result)")
//            } else if let error = error {
//                print("Error: \(error)")
//            }
//        }
//        APIClient.uploadImage(imageData: imageData! , endpoint: "https://api.etlas.tech/monuments/detect/", completion: completion)
        
    }
}
