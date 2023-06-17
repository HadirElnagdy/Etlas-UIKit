//
//  ToursTableViewCell.swift
//  Etlas
//
//  Created by Hadir on 17/06/2023.
//

import UIKit

class ToursTableViewCell: UITableViewCell {
    @IBOutlet weak var tourDetails: UILabel!
    @IBOutlet weak var tourImg: UIImageView!
    @IBOutlet weak var tourRating: RatingView!
    @IBOutlet weak var tourName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(model: AllToursUIModel?) {
        self.tourImg = model?.tourImg
        self.tourName.text = model?.tourName
        self.tourDetails.text = model?.tourDetails
        self.tourRating.cosmosView.rating = model?.tourRating ?? 0.0
    }
    
}
