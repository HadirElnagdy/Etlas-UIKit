//
//  MainMenuViewController.swift
//  Etlas
//
//  Created by Hadir on 14/06/2023.
//

import UIKit

class MainMenuViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var menuView: UIView!
    
   
   // MARK: - Lifecycle methods
   override func viewDidLoad() {
       super.viewDidLoad()
       setupUI()
   }
   
   // MARK: - IBActions
    @IBAction func closePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func aboutUsPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "AboutUsViewController", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController")
        self.present(VC, animated: true)
        
    }
    @IBAction func contactUsPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "ContactUsViewController", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "ContactUsViewController")
        self.present(VC, animated: true)
    }
    @IBAction func termsPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "TermsViewController", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "TermsViewController")
        self.present(VC, animated: true)
        
    }
    
    
    
   // MARK: - Private methods
   private func setupUI() {
       menuView.layer.cornerRadius = 30
       menuView.layer.masksToBounds = true
   }

}
