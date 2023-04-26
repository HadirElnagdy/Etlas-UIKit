//
//  SignInViewController.swift
//  Etlas
//
//  Created by Hadir on 10/04/2023.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func SignUpPressed(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "SignUpViewController", bundle: nil)
        let signUpVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
        self.show(signUpVC, sender: self)
    }
    
    @IBOutlet weak var SignInButton: UIButton!{
        didSet{
            let customColor = UIColor(red: 0.75, green: 0.51, blue: 0.28, alpha: 1.0)
            SignInButton.backgroundColor = customColor
            SignInButton.layer.cornerRadius = 20
            SignInButton.layer.borderWidth = 2
            SignInButton.layer.borderColor = customColor.cgColor
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
