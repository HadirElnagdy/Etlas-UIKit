//
//  FavArticlesModel.swift
//  Etlas
//
//  Created by Hadir on 22/06/2023.
//

import UIKit

struct FavArticleModel {
    
    let articleTitle: String
    let description: String
    let date: String
   // let imageURL: String
    let image: UIImage
    
    init(
        articleTitle: String? = "Anubis",
        description: String? = "Know more about Anubis and his powers.",
        date: String? = "15 Jan 2023",
        //imageURL: String? = "nil"
        image: UIImage? = UIImage(named: "img_favArticle")
        
    ) {
        self.articleTitle = articleTitle!
        self.description = description!
        self.date = date!
        self.image = image!
    }
    
}
