//
//  TermsViewController.swift
//  Etlas
//
//  Created by Hadir on 17/06/2023.
//

import UIKit

class TermsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var termsLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadTermsAndConditions()
    }
    
    // MARK: - IBActions
    
    @IBAction func closePressed(_ sender: UIButton) {
        dismissLastTwoPresentedViewControllers()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        setupBlueView()
        setupImageView()
    }
    
    private func setupBlueView() {
        let cornerRadius: CGFloat = 30.0
        blueView.layer.cornerRadius = cornerRadius
        blueView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        blueView.layer.masksToBounds = true
    }
    
    private func setupImageView() {
        let rotationAngle: CGFloat = -17.0
        let rotationAngleInRadians = rotationAngle * .pi / 180.0
        imageView.transform = CGAffineTransform(rotationAngle: rotationAngleInRadians)
    }
    
    private func loadTermsAndConditions() {
        guard let htmlFileURL = Bundle.main.url(forResource: "Terms and Conditions", withExtension: "html") else {
            return
        }
        
        do {
            let htmlString = try String(contentsOf: htmlFileURL, encoding: .utf8)
            
            let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ]
            
            if let attributedString = try? NSAttributedString(data: Data(htmlString.utf8), options: options, documentAttributes: nil) {
                let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
                
                mutableAttributedString.addAttributes([.foregroundColor: UIColor.white], range: NSMakeRange(0, mutableAttributedString.length))
                
                termsLabel.attributedText = mutableAttributedString
            }
        } catch {
            print("Error loading HTML file: \(error)")
        }
        
        termsLabel.numberOfLines = 0
        termsLabel.lineBreakMode = .byWordWrapping
        termsLabel.sizeToFit()
        
        scrollView.contentSize = termsLabel.frame.size
    }
    private func dismissLastTwoPresentedViewControllers() {
        guard let presentingViewController = self.presentingViewController?.presentingViewController else {
            return
        }
        
        presentingViewController.dismiss(animated: true, completion: nil)
    }

}
