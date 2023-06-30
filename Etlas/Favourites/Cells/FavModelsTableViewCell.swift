//
//  FavModelsTableViewCell.swift
//  Etlas
//
//  Created by Hadir on 21/06/2023.
//

import UIKit

class FavModelsTableViewCell: UITableViewCell {

   
    // MARK: - Properties
    @IBOutlet weak var modelImg: UIImageView!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var period: UILabel!
    @IBOutlet weak var scanningDate: UILabel!
    
 

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
    
    
    @IBAction func deletePressed(_ sender: UIButton) {
        // remove it from favs
    }
    
    
    // MARK: - Private methods
    func configure(model: FavModelModel?) {
        self.modelImg.image = model?.modelImg
        self.modelName.text = model?.modelName
        self.period.text = model?.period
        self.scanningDate.text = model?.scanningDate
        
    }
   
    
    
}
