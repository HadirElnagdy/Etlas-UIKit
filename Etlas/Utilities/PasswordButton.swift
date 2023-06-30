//
//  PasswordButton.swift
//  Etlas
//
//  Created by Hadir on 27/06/2023.
//

import UIKit

class PasswordButton: UIButton {
    // Associated text field
    var textField: UITextField?
    
    // Images for the button states
    let showImage = UIImage(systemName: "eye")
    let hideImage = UIImage(systemName: "eye.slash")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Add target action for the button
        addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
    }
    
    @objc private func togglePasswordVisibility() {
        textField?.isSecureTextEntry.toggle()
        let image = textField?.isSecureTextEntry ?? true ? showImage : hideImage
        setImage(image, for: .normal)
    }
}
