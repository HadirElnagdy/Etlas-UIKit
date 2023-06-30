//
//  AllArticlesCollectionViewCell.swift
//  Etlas
//
//  Created by Hadir on 23/06/2023.
//

import UIKit

class AllArticlesCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    @IBOutlet weak var articleImg: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    @IBOutlet weak var articleDate: UILabel!

    // MARK: - Lifecycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    // MARK: - IBActions
    @IBAction func learnMorePressed(_ sender: UIButton) {
        
    }
    
    
    
    // MARK: - Private methods
    func configure(model: AllArticlesModel?) {
        self.articleImg.image = model?.articleImg?.image ?? UIImage(named: "img_Anubis")
        self.articleTitle.text = model?.articleTitle
        self.articleDescription.text = model?.description
        self.articleDate.text = model?.date
    }
   

}
