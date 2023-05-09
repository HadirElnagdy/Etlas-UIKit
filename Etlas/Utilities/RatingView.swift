//
//  RatingView.swift
//  Etlas
//
//  Created by Hadir on 08/05/2023.
//

import UIKit
import Cosmos
import TinyConstraints

class RatingView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.addSubview(cosmosView)
        cosmosView.centerInSuperview()
    }
    
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        view.settings.emptyImage = UIImage(named: "ic_RatingStarEmpty")?.withRenderingMode(.alwaysOriginal)
        view.settings.filledImage = UIImage(named: "ic_RatingStarFilled")?.withRenderingMode(.alwaysOriginal)
        view.settings.fillMode = .precise
        view.settings.starMargin = 3.6
        return view
    }()

}
