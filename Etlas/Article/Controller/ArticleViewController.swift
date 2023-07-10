//
//  ArticleViewController.swift
//  Etlas
//
//  Created by Hadir on 17/06/2023.
//

import UIKit

class ArticleViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var articleImg: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleDateLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    
    var isLoved: Bool = false
    var id: String = ""
    var article: ArticleResult?
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
//        APIClient.isFavorite(id: (article?.id)!){ result in
//            switch result {
//            case .success(let model):
//                if model.isFavorite == nil {"isFav returned nil!"}
//                self.isLoved = model.isFavorite ?? false
//               // print(model.isFavorite)
//                break
//            case .failure(let error):
//                debugPrint(error)
//            }
//        }
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func backPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func lovePressed(_ sender: UIButton) {
       if !isLoved {
        APIClient.addArticleToFavs(id: (article?.id)!){[weak self] (result) in
            switch result {
            case .success(_):
                self?.isLoved.toggle()
                break
            case .failure(let error):
                debugPrint(error)
            }
            
        }
           
       }else {
           APIClient.delFavArticle(id: (article?.id)!){[weak self] (result) in
               switch result {
               case .success(_):
                   self?.isLoved.toggle()
                   break
               case .failure(let error):
                   print(error)
               }
               
           }
       }
        setupButtonImage()
        
    }
    
    // MARK: - Private methods
    private func setupUI() {
        blueView.layer.cornerRadius = 30.0
        blueView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        blueView.layer.masksToBounds = true
        articleTitleLabel.text = article?.articleTitle
        let attributedDescription = NSMutableAttributedString()
        
        let titleFont = UIFont(name: "Montserrat-Bold", size: 18.0) ?? UIFont.boldSystemFont(ofSize: 18.0)
        let descriptionFont = UIFont(name: "Montserrat-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
        
        if let sections = article?.sections {
            for section in sections {
                let titleAttributes: [NSAttributedString.Key: Any] = [
                    .font: titleFont,
                ]
                let titleString = NSAttributedString(string: section.sectionTitle ?? "", attributes: titleAttributes)
                attributedDescription.append(titleString)
                
                let descriptionAttributes: [NSAttributedString.Key: Any] = [
                    .font: descriptionFont,
                ]
                let descriptionString = NSAttributedString(string: "\n\n\(section.description ?? "")\n\n\n", attributes: descriptionAttributes)
                attributedDescription.append(descriptionString)
            }
        }
        articleDescriptionLabel.attributedText = attributedDescription
        
        if let dateString = article?.date, let date = dateFormatter.date(from: dateString) {
            articleDateLabel.text = formattedDateString(from: date)
        } else {
            articleDateLabel.text = nil
        }
        if let imageURLString = article?.imageURL, let imageURL = URL(string: imageURLString) {
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
    
    private func setupButtonImage() {
        let imageName = isLoved ? "ic_selectedFavButton" : "ic_FavButton"
        let image = UIImage(named: imageName)
        loveButton.setImage(image, for: .normal)
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
