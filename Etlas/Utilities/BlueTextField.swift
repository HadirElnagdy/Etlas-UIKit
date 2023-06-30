//
//  BlueTextField.swift
//  Etlas
//
//  Created by Hadir on 03/05/2023.
//

import UIKit

class BlueTextField: UITextField {

    // MARK: - Properties
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureTextField()
    }
    override func layoutSubviews() {
            super.layoutSubviews()
            //self.frame.size.height = 50
            self.frame.size.width = 345
        }
    override func awakeFromNib() {
            super.awakeFromNib()
            textColor = UIColor.white
        }
    
    // MARK: - Private Methods
    
    private func configureTextField() {
        backgroundColor = UIColor(red: 0/255, green: 52/255, blue: 65/255, alpha: 1.0)
        layer.cornerRadius = 20
        clipsToBounds = true
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "",
                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
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

