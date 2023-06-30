//
//  ContactUsViewController.swift
//  Etlas
//
//  Created by Hadir on 26/05/2023.
//

import UIKit

class ContactUsViewController: BaseViewController {

    
     // MARK: - IBOutlets
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var messageTextView: MessageTextView!
    

    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func closePressed(_ sender: UIButton) {
        dismissLastTwoPresentedViewControllers()
    }
    @IBAction func submitPressed(_ sender: BrownButton) {
    }
    
    
     


    
    // MARK: - Private methods
    private func setupUI() {
        blueView.layer.cornerRadius = 30
        blueView.layer.masksToBounds = true
        messageTextView.placeholder = "Write a message."
    }
    private func dismissLastTwoPresentedViewControllers() {
        guard let presentingViewController = self.presentingViewController?.presentingViewController else {
            return
        }
        
        presentingViewController.dismiss(animated: true, completion: nil)
    }


}
