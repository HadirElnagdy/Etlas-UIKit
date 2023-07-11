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
        
    }
    @IBAction func deletePressed(_ sender: UIButton) {
        
    }
    
    
    // MARK: - Private methods
    func configure(model: FavoritesResult?) {
        guard let article = model?.article else {
            return
        }
        articleTitle.text = article.articleTitle
        articleDescription.text = article.description
        if let dateString = article.date, let date = dateFormatter.date(from: dateString) {
            articleDate.text = formattedDateString(from: date)
        } else {
            articleDate.text = nil
        }
        if let imageURLString = article.imageURL, let imageURL = URL(string: imageURLString) {
            URLSession.shared.dataTask(with: imageURL) { [weak self] (data, _, error) in
                if let error = error {
                    print("Error downloading image: \(error.localizedDescription)")
                    return
                }

                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.articleImg.image = image
                    }
                }
            }.resume()
        }
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    private func formattedDateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: date)
    }
    

    
    
}
