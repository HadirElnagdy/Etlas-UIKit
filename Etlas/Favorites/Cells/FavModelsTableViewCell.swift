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
    func configure(model: FavoritesResult?) {
        guard let monument = model?.monument else {
            return
        }
        modelName.text = monument.name
        period.text = "\(monument.date) | \(monument.location)"
        scanningDate.text = monument.updated
        if let imageURLString = monument.imageURL, let imageURL = URL(string: imageURLString) {
            URLSession.shared.dataTask(with: imageURL) { [weak self] (data, _, error) in
                if let error = error {
                    print("Error downloading image: \(error.localizedDescription)")
                    return
                }

                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.modelImg.image = image
                    }
                }
            }.resume()
        }

    }

    
    
}

