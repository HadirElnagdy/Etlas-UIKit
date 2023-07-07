//
//  AllArticlesCollectionViewCell.swift
//  Etlas
//
//  Created by Hadir on 23/06/2023.
//

import UIKit

class AllArticlesCollectionViewCell: UICollectionViewCell {
    
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
    
    
    
    // MARK: - IBActions
    @IBAction func learnMorePressed(_ sender: UIButton) {
        
    }
    
    
    
    // MARK: - Private methods
    func configure(model: ArticleResult?) {
        // self.articleImg.image = model?.articleImg?.image ?? UIImage(named: "img_Anubis")
        articleTitle.text = model?.articleTitle
        articleDescription.text = model?.description
        if let dateString = model?.date, let date = dateFormatter.date(from: dateString) {
            articleDate.text = formattedDateString(from: date)
        } else {
            articleDate.text = nil
        }
        
        articleImg.image = UIImage(named: "photo")
        
        if let imageURLString = model?.imageURL, let imageURL = URL(string: imageURLString) {
            URLSession.shared.dataTask(with: imageURL) { [weak self] (data, _, error) in
                if let error = error {
                    print("Error downloading article image: \(error.localizedDescription)")
                    return
                }
                
                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.articleImg.image = image
                    }
                }
            }.resume()
        }
        articleImg.layer.cornerRadius = 20
        articleImg.clipsToBounds = true
        
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





