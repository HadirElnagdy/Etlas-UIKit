//
//  LoadingPopUpViewController.swift
//  Etlas
//
//  Created by Hadir on 05/07/2023.
//

import UIKit
import NVActivityIndicatorView

class LoadingPopUpViewController: UIViewController {

    
    // MARK: - IBOutlets
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var loadingIndecatorView: NVActivityIndicatorView!
    
   // MARK: - Lifecycle methods
   override func viewDidLoad() {
       super.viewDidLoad()
       setupUI()
   }
   
   // MARK: - IBActions
   


   
   // MARK: - Private methods
   private func setupUI() {
       popUpView.layer.cornerRadius = 30
       popUpView.layer.masksToBounds = true
       loadingIndecatorView.type = .ballPulseSync
       loadingIndecatorView.color = .white
       loadingIndecatorView.startAnimating()
      
   }


}
