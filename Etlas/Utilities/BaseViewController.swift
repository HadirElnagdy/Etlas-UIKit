//
//  BaseViewController.swift
//  Etlas
//
//  Created by Hadir on 03/05/2023.
//

import UIKit

class BaseViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
