//
//  ForgotPassOTPViewController.swift
//  Etlas
//
//  Created by Hadir on 09/05/2023.
//

import UIKit

class OTPViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var textField1: CustomTextField!
    @IBOutlet weak var textField2: CustomTextField!
    @IBOutlet weak var textField3: CustomTextField!
    @IBOutlet weak var textField4: CustomTextField!
    
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField1.becomeFirstResponder()
    }
    
    // MARK: - IBActions
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Private methods
    private func setupUI() {
        let otpTextFields = [textField1, textField2, textField3, textField4]
        for otpTextField in otpTextFields {
            otpTextField!.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
            otpTextField!.textAlignment = .center
            otpTextField!.font = UIFont(name: "Montserrat-SemiBold", size: 31)
        }

    }
    @objc func textDidChange(textField: UITextField){
        switch textField {
        case textField1:
            textField2.becomeFirstResponder()
            break
        case textField2:
            textField3.becomeFirstResponder()
            break
        case textField3:
            textField4.becomeFirstResponder()
            break
        case textField4:
            textField4.resignFirstResponder()
            break
        default:
            break
        }
    }
    
    
    
}
