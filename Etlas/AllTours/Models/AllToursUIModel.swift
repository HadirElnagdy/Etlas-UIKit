//
//  AllToursUIModel.swift
//  Etlas
//
//  Created by Hadir on 17/06/2023.
//

import Foundation
import UIKit

struct AllToursUIModel {
    var tourDetails: String?
    var tourImg: UIImageView?
    var tourRating: Double?
    var tourName: String?
    
    init(
        tourDetails: String? = "where you can visit the pyramids and ride the camels.",
        tourImg: UIImageView? = UIImageView(image: UIImage(named: "img_GizaTour")),
        tourRating: Double? = 3.0,
        tourName: String? = "Giza tour"
    ) {
        self.tourDetails = tourDetails
        self.tourImg = tourImg
        self.tourRating = tourRating
        self.tourName = tourName
    }
    
}

