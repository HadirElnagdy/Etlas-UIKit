//
//  TBMiddleButtonVCViewController.swift
//  Etlas
//
//  Created by Hadir on 09/05/2023.
//

import UIKit

class TBMiddleButtonVCViewController: UITabBarController, UITabBarControllerDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate{

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.selectedIndex = 0
        setupMiddleButton()
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
extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
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
