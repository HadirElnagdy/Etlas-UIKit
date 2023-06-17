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
    

    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func closePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
     


    
    // MARK: - Private methods
    private func setupUI() {
        blueView.layer.cornerRadius = 30
        blueView.layer.masksToBounds = true
    }




}
