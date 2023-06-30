//
//  AllToursCollectionViewCell.swift
//  Etlas
//
//  Created by Hadir on 23/06/2023.
//

import UIKit

class AllToursCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tourImg: UIImageView!
    @IBOutlet weak var tourName: UILabel!
    @IBOutlet weak var tourDetails: UILabel!
    @IBOutlet weak var tourRating: RatingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    
    func configure(model: AllToursUIModel?) {
        self.tourImg.image = model?.tourImg?.image
        self.tourName.text = model?.tourName
        self.tourDetails.text = model?.tourDetails
        self.tourRating.cosmosView.rating = model?.tourRating ?? 0.0
    }
    


}
