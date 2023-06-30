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
    @IBOutlet weak var articleImg: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleDateLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    
    var isLoved = false
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func backPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func lovePressed(_ sender: UIButton) {
        isLoved.toggle()
        setupButtonImage()
        //add to favourites
    }
    
    // MARK: - Private methods
    private func setupUI() {
        blueView.layer.cornerRadius = 30.0
        blueView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        blueView.layer.masksToBounds = true
    }
    
    private func setupButtonImage() {
        let imageName = isLoved ? "ic_selectedFavButton" : "ic_FavButton"
        let image = UIImage(named: imageName)
        loveButton.setImage(image, for: .normal)
    }
}
