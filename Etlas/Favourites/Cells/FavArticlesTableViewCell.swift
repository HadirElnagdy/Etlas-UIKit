//
//  FavArticlesTableViewCell.swift
//  Etlas
//
//  Created by Hadir on 21/06/2023.
//

import UIKit

class FavArticlesTableViewCell: UITableViewCell {

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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - IBActions
    
    @IBAction func openPressed(_ sender: UIButton) {
        // go to article with the same id
    }
    @IBAction func deletePressed(_ sender: UIButton) {
        // remove it from favs
    }
    
    
    // MARK: - Private methods
    func configure(model: FavArticleModel?) {
        self.articleImg.image = model?.image
        self.articleTitle.text = model?.articleTitle
        self.articleDescription.text = model?.description
        self.articleDate.text = model?.date
    }
   
    
    
    
}
