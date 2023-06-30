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
        dismissAllPresentedViewControllers()
    }
    
    @IBAction func aboutUsPressed(_ sender: UIButton) {
        let vc = UIStoryboard(name: "InfoAboutUsViewController", bundle: nil).instantiateViewController(withIdentifier: "AboutUsViewController")
        self.present(vc, animated: true)
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
    
    private func dismissAllPresentedViewControllers() {
        if let presentedViewController = self.presentedViewController {
            presentedViewController.dismiss(animated: true) {
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
