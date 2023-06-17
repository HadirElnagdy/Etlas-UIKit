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
        tourDetails: String? = "Details",
        tourImg: UIImageView? = nil,
        tourRating: Double? = 2.5,
        tourName: String? = "Name"
    ) {
        self.tourDetails = tourDetails
        self.tourImg = tourImg
        self.tourRating = tourRating
        self.tourName = tourName
    }
    
}
