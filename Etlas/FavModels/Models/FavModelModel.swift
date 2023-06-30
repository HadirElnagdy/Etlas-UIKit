//
//  FavModelModel.swift
//  Etlas
//
//  Created by Hadir on 23/06/2023.
//

import UIKit

struct FavModelModel {
    
    let modelName: String
    let period: String
    let scanningDate: String
    let modelImg: UIImage
    
    init(
        modelName: String? = "Anubis Statue",
        period: String? = "200 BC | Egypt ",
        scanningDate: String? = "Scanned 12 Oct 2021",
        //imageURL: String? = "nil"
        modelImg: UIImage? = UIImage(named: "img_3dAnubis")
        
    ) {
        self.modelName = modelName!
        self.period = period!
        self.scanningDate = scanningDate!
        self.modelImg = modelImg!
    }
    
}
