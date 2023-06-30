//
//  ToursTableViewCell.swift
//  Etlas
//
//  Created by Hadir on 17/06/2023.
//

import UIKit

class ToursTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tourImg: UIImageView!
    @IBOutlet weak var tourName: UILabel!
    @IBOutlet weak var tourDetails: UILabel!
    @IBOutlet weak var tourRating: RatingView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        contentView.widthAnchor.constraint(equalToConstant: 360).isActive = true

    }
    
    func configure(model: AllToursUIModel?) {
        self.tourImg.image = model?.tourImg?.image
        self.tourName.text = model?.tourName
        self.tourDetails.text = model?.tourDetails
        self.tourRating.cosmosView.rating = model?.tourRating ?? 0.0
    }
    

}
