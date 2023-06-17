//
//  ArticleViewController.swift
//  Etlas
//
//  Created by Hadir on 17/06/2023.
//

import UIKit

class ArticleViewController: UIViewController {

    
     // MARK: - IBOutlets
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var loveButton: UIButton!
    var isLoved = false
    

    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func lovePressed(_ sender: UIButton) {
        isLoved.toggle()
        setupButtonImage()
    }
    
     


    
    // MARK: - Private methods
    private func setupUI() {
        blueView.layer.cornerRadius = 30.0
        blueView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        blueView.layer.masksToBounds = true
    }
    func setupButtonImage() {
        let imageName = isLoved ? "ic_SelectedFavButton" : "ic_FavButton"
        let image = UIImage(named: imageName)
        loveButton.setImage(image, for: .normal)
    }




}
