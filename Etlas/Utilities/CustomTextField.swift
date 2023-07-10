//
//  CustomTextField.swift
//  Etlas
//
//  Created by Hadir on 03/05/2023.
//

import UIKit

class CustomTextField: UITextField {

    // MARK: - Properties
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureTextField()
    }
    
    // MARK: - Private Methods
    
    private func configureTextField() {
        layer.cornerRadius = 20
        clipsToBounds = true
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        font = UIFont(name: "Montserrat-SemiBold", size: 20)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
